class GemInfosController < ApplicationController
  def index
  	@gem_infos = GemInfo.all
  	info_parser	
  end

  def info_parser
  	ParserService.new.parse_gem
  end

end
