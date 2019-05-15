class ParserService
    def initialize(title)
      @title = title
    end
    attr_reader :title
  end

  def scrape_reddit
    require 'open-uri'
    doc = Nokogiri::HTML(open("https://rubysec.com/advisories"))

    entries = doc.css('section')
    @entriesArray = []
    entries.each do |entry|
      title = entry.css('td , a').text
      @entriesArray << ParserService.new(title)
    end

    render template: 'scrape_reddit'

  end
end