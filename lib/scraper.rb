require 'mechanize'
require_relative './prompt'
require_relative './headline.rb'
require_relative './get_type_of_stories_link'
require_relative 'get_headline_link_from_user'

# Runs the scraper
def run_scraper
    # Start input as empty
    continue_program = ""
    
    # Initialize mechanize
    mechanize = Mechanize.new
    
    until continue_program.downcase() == "n" do
        # Get the link with the type of stories the user wants
        page = mechanize.get(get_type_of_stories_link())
    
        # Go through each of the headings and put the link and heading into their respective arrays
        headlines = page.search('.pp_bigheadlines_heading').map {|element| Headline.new(element.text.strip, element.children[1].attributes['href'].to_s.delete_prefix('//news.osu.edu/'))}
    
        # Get the page with the headline the user wanted
        page = mechanize.get(get_headline_link_from_user(headlines))
    
        # Print article link
        puts "\nArticle link: #{page.uri}"
    
        # Print out the article text
        page.search('.ppmodule_textblock').each do |block|
            puts "\n#{block.text.strip}"
        end
    
        continue_program = prompt("\nWould you like to read another article? (y/n): ")
    end
    
    puts "\nEnding the program"
end

run_scraper
