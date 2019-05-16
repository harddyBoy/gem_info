class GemInfosController < ApplicationController

	before_action :authenticate_user!

  def index
  	@gem_infos = GemInfo.all
  	info_parser	
  end

  def send_mail
  	# UserMailer.send_new_published.deliver.now!
     UserMailer.send_new_published(@user).deliver
  end

  def info_parser
  	ParserService.new.parse_gem
  end

end
