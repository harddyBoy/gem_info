class GemInfosController < ApplicationController
  def index
  	@gem_infos = GemInfo.all

  	require 'nokogiri'
	require 'open-uri'
	url = "https://rubysec.com/advisories"
	page = Nokogiri::HTML(open(url))

	
	# section = page.css(".table")
	# @content = section.css('a')
	# .map { |link| link['href'] }	
	gem_title = page.css("tr td a")
	@gem_title_array = []
	gem_title.map do |a|
		gem_title_name = a.text
		@gem_title_array.push(gem_title_name)
	end
	@gem_title_array.each do |element|
		puts element
		content = GemInfo.find_or_create_by(title: element)
	end
 	
  end

  def info_parser
  end

end
