require 'minitest/autorun'
require_relative '../lib/prompt'
require_relative 'lib/headline.rb'
require_relative 'lib/get_type_of_stories_link'
require_relative 'lib/get_headline_link_from_user'
require 'mechanize'

class TestUrl < MiniTest::Test
    #tests if user input will pull up the requested category from the method prompt
    def test_get_type_of_stories_link
    actual_url = get_type_of_stories_link
        puts "please input the number 2 for testing\n"
        expected_url = ""https://news.osu.edu/campus/"
        assert_equal expected_url, actual_url
    end
end
