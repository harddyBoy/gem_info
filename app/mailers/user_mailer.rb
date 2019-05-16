class UserMailer < ApplicationMailer

	def send_new_published(user)
		@user = user #params[:user]
	    @gem_infos = @user.gem_infos.published_today
		@url = 'http://localhost:3000/'
		mail(to: @user.email, subject: 'Welcome to Gem Info')
	end
end
