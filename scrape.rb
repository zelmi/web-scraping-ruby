require 'mechanize'

# Makes prompting easier
def prompt(message)
    puts message
    gets.chomp()
end

# Used to convert user selection to the string link
mapped_choices = ["sports", "campus", "science-and-medicine", "arts-and-humanities", "the-conversation", "covid-19-updates"]

# Prompt the user for what type of stories they want
input = prompt "What type of stories would you like?\n1. Sports\n2. Campus\n3. Science & Medicine\n4. Arts & Humanities\n5. The Conversation\n6. Covid Updates"

# Initialize mechanize
mechanize = Mechanize.new

# Get the link with the type of stories the user wants
page = mechanize.get("https://news.osu.edu/#{mapped_choices[input.to_i() - 1]}/")

# Stores the links & headlines
links = []
headlines = []

# Go through each of the headings and put the link and heading into their respective arrays
page.search('.pp_bigheadlines_heading').each do |element|
    headlines.push(element.text.strip)
    links.push(element.children[1].attributes['href'].to_s.delete_prefix('//news.osu.edu/'))
end

# Ask to choose a headline
puts "Choose a headline to read"

# Print out the headlines
for i in 1..headlines.length do
    puts "#{i}: #{headlines[i - 1]}"
end

# Get the user input
input = gets.chomp()

# Get the page with the headline the user wanted
page = mechanize.get("https://news.osu.edu/#{links[input.to_i() - 1]}")

# Print out the article text
page.search('.ppmodule_textblock').each do |block|
    pp block.text
end
