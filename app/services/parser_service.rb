require 'open-uri'

class ParserService
  def parse_gem


    url = "https://rubysec.com/advisories"
    page = Nokogiri::HTML(open(url))


    #get url of each post
    scrapted_url= page.css("tr td a")

    @gem_url_array = []

    scrapted_url.map { |link| link['href'] 
      url_name = link.text
      @gem_url_array.push(url_name)
    }

    @gem_url_array.each do |element|
      content = GemInfo.find_or_create_by(url: element)
    end

    #get title of each post(work incorrectly)

    # gem_title = page.css("tr td a")
    # @gem_title_array = []

    # gem_title.map { |link|
    #   gem_title_name = link.text
    #   @gem_title_array.push(gem_title_name)
    # }

    # @gem_title_array.each do |element|
    #   content = GemInfo.find_or_create_by(gem_name: element)
   
    # end
  end
end