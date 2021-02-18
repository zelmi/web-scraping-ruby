require_relative "./prompt"

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
