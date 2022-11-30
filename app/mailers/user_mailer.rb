class UserMailer < ApplicationMailer
	default from: 'notifications@example.com'

  def welcome_email(id)
    @user = Person.find(id)
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
