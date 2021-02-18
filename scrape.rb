require 'mechanize'
require_relative './headline.rb'

# Makes prompting easier
def prompt(message)
    puts message
    gets.chomp()
end

# Gets the link for the type of stories the user wants to read
def get_type_of_stories_link
    # Used to convert user selection to the string link
    mapped_choices = ["sports", "campus", "science-and-medicine", "arts-and-humanities", "the-conversation", "covid-19-updates"]
    
    # Prompt the user for what type of stories they want
    input = prompt "What type of stories would you like? Please input the number beside it.\n1. Sports\n2. Campus\n3. Science & Medicine\n4. Arts & Humanities\n5. The Conversation\n6. Covid Updates"
    
    while !input.to_i().between?(1,6) #keep asking for input until input is valid
        puts "invalid input, please try again"
        input = prompt "What type of stories would you like? Please input the number beside it.\n1. Sports\n2. Campus\n3. Science & Medicine\n4. Arts & Humanities\n5. The Conversation\n6. Covid Updates"
    end

    "https://news.osu.edu/#{mapped_choices[input.to_i() - 1]}/"
end

# Gets the desired headline link from the user
def get_headline_link_from_user(headlines)
    # Ask to choose a headline
    puts "\nChoose a headline to read. Input the number beside it. "

    # Print out the headlines
    for i in 1..headlines.length do
        puts "#{i}: #{headlines[i - 1].title}"
    end

    # Get the user input
    input = gets.chomp()

    while !input.to_i().between?(1, headlines.length)
        puts "\nInvalid input. Please try again."
        puts "Choose a headline to read. Input the number beside it. "

        # Print out the headlines
        for i in 1..headlines.length do
            puts "#{i}: #{headlines[i - 1].title}"
        end

        input = gets.chomp()
    end

    "https://news.osu.edu/#{headlines[input.to_i() - 1].link}"
end

# Runs the scraper
def run_scraper
    # Start input as empty
    continue_program = ""
    
    # Initialize mechanize
    mechanize = Mechanize.new
    
    until continue_program.downcase() == "no" do
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
    
        puts "\nRead another article? Type 'no' if not. Press any other key for yes."
    
        continue_program = gets.chomp()
    end
    
    puts "\nEnding the program"
end

run_scraper
