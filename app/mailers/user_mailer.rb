class UserMailer < ApplicationMailer
	default from: 'geminfo@gmail.com'

	def welcome_email(user)
		@user = user #params[:user]
		@url  = 'http://geminfo.com/login'
		mail(to: @user.email, subject: 'Welcome to My Awesome Site')
	end
end
