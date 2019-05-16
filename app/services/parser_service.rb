class ParserService
  def parse_gem

    require 'open-uri'
    url = "https://rubysec.com/advisories"
    page = Nokogiri::HTML(open(url))


    #get url of each post
    gem_url = page.css("tr td a @href")
    @gem_url_array = []

    gem_url.map { |link| link['href'] 
      gem_url_name = link.text
      @gem_url_array.push(gem_url_name)
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
    #   content = GemInfo.find_or_create_by(title: element)
   
    # end
  end
end