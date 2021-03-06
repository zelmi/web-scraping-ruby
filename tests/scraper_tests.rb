require 'minitest/autorun'
require 'mechanize'
require_relative '../lib/prompt'
require_relative '../lib/headline.rb'
require_relative '../lib/get_type_of_stories_link'
require_relative '../lib/get_headline_link_from_user'

class TestUrl < MiniTest::Test
    #tests if user input will pull up the requested category using method test_get_type_of_stories_link
    def test_get_type_of_stories_link
        puts "please input the number 2 for testing\n"
    	actual_url = get_type_of_stories_link
        expected_url = "https://news.osu.edu/campus/"
        assert_equal expected_url, actual_url
    end

    #tests if user input will pull up the correct article using method get_headline_link_from_user
    def test_get_headline_link_from_user
        # Initialize mechanize
    	mechanize = Mechanize.new
        page = mechanize.get("https://news.osu.edu/sports/")
        # Go through each of the headings and put the link and heading into their respective arrays
        headlines = page.search('.pp_bigheadlines_heading').map {|element| Headline.new(element.text.strip, element.children[1].attributes['href'].to_s.delete_prefix('//news.osu.edu/'))}
        # Get the page with the headline the user wanted
        puts "please input the number 1 for testing \n"
        actual_url = get_headline_link_from_user(headlines)
        expected_url = "https://news.osu.edu/2021-ohio-state-big-ten-football-schedule-revision-announced/"    
        assert_equal expected_url, actual_url
    end
    
    #tests to see if the method prompt recieves the correct input
    def test_prompt
        actual_input = prompt ("please input the number 4 for testing \n")
        expected_input = "4"
        assert_equal expected_input, actual_input
    end
end
