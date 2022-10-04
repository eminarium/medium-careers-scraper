require 'HTTParty'
require 'Nokogiri'

class MediumCareersScraper
  attr_accessor :url, :positions

  def initialize(url)
    @url = url
    @positions = {}
  end

  def get_positions
    doc = HTTParty.get(url)
    parsed_page ||= Nokogiri::HTML(doc.body)

    groups = parsed_page.css('.postings-wrapper').css('.postings-group')

    groups.each do |group|
      team = group.css('.posting-category-title').text
      postings = group.css('.posting')

      # Positions hash will store positions as an array under specific department key
      positions["#{team.to_s}"] = []

      postings.each do |posting|
        title = posting.css('.posting-title').search('h5').first.text
        location = posting.css('.sort-by-location').text
        team = posting.css('.sort-by-team').text

        position = { title: title, location: location, team: team }
        positions["#{team.to_s}"] << position
      end
    end
  end

  def print_report
    positions.each do |department, positions_array|
      puts department
      puts "-"*department.length
      positions_array.each{ |position| puts "#{position[:title]} | #{position[:location]}"}
      puts "-"*55
    end
  end
end

scraper = MediumCareersScraper.new('https://jobs.lever.co/medium')
scraper.get_positions
scraper.print_report