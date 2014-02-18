class User < ActiveRecord::Base
  attr_accessible :username, :password, :email, :biography, :age, :gender, :location, :admin, :session_token, :photo
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

  has_many :reviews

  has_many :rated_restaurants,
  through: :reviews,
  source: :restaurant

  has_many :favorites

  has_many :favorite_places,
  through: :favorites,
  source: :restaurant

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
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
