class AuthMailer < ActionMailer::Base
  default from: "admin@example.com"

  def signup_email(user)
    @user = user
    @token = @user.auth_token
    @url = "http://localhost:3000/users/#{@user.id}/activate?auth_token=#{@token}"

    mail(
      :to => user.email,
      :subject => 'Thanks for signing up! Please confirm your account.'
    )
  end
end
