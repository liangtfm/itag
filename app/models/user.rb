class User < ActiveRecord::Base
  extend FriendlyId
  friendly_id :username, :use => :slugged

  attr_accessible :username, :password, :email, :biography, :age, :gender, :location, :admin, :session_token, :photo, :uid, :provider, :image
  attr_reader :password

  before_validation :ensure_session_token

  validates :username, :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, :allow_nil => true }
  validates :password_digest, presence: true
  validates :username, :email, uniqueness: true

  has_attached_file :photo, :styles => {
    :big => "100x100#",
    :small => "60x60#"
  }

  has_many :reviews,
  dependent: :destroy

  has_many :rated_restaurants,
  through: :reviews,
  source: :restaurant

  has_many :favorites,
  dependent: :destroy

  has_many :favorite_places,
  through: :favorites,
  source: :restaurant

  has_many :follows,
  class_name: "Follow",
  foreign_key: :followed_id,
  primary_key: :id,
  dependent: :destroy

  has_many :followed,
  class_name: "Follow",
  foreign_key: :follower_id,
  primary_key: :id,
  dependent: :destroy

  has_many :followers,
  through: :follows,
  source: :follower

  has_many :followed_users,
  through: :followed,
  source: :followed

  has_many :vote_tags,
  dependent: :destroy

  has_many :voted_reviews,
  through: :vote_tags,
  source: :review

  def self.find_uid_or_create(auth)

    user = User.find_by_uid(auth[:uid])

    unless user
      if auth[:provider] == 'facebook'
        user = User.create!(
                 uid: auth[:uid],
                 provider: auth[:provider],
                 username: (auth[:info][:nickname] || auth[:info][:first_name]+rand(1..1000).to_s),
                 email: auth[:info][:email],
                 image: auth[:info][:image] + "?type=large",
                 password: SecureRandom::urlsafe_base64(16)
               )
      elsif auth[:provider] == 'twitter'
        user = User.create!(
                 uid: auth[:uid],
                 provider: auth[:provider],
                 username: auth[:info][:nickname],
                 email: "fillmein@right.meow",
                 image: auth[:info][:image].gsub("_normal", ""),
                 password: SecureRandom::urlsafe_base64(16)
               )
      else
        #asdf
      end
    end

    return user
  end


  def self.find_by_credentials(username, password)
    user = (User.find_by_username(username) || User.find_by_email(username))
    user.try(:is_password?, password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def is_password?(unencrypted_password)
    BCrypt::Password.new(self.password_digest).is_password?(unencrypted_password)
  end

  def password=(unencrypted_password)
    if unencrypted_password.present?
      @password = unencrypted_password
      self.password_digest = BCrypt::Password.create(unencrypted_password)
    end
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

end
