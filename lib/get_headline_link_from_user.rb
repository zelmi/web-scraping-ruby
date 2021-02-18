# Gets the desired headline link from the user
def get_headline_link_from_user(headlines)
    # Ask to choose a headline
    puts "\nChoose a headline to read. Input the number beside it. "

    # Print out the headlines
    for i in 1..headlines.length do
        puts "#{i}: #{headlines[i - 1].title}"
    end

    print "Selection: "
    input = gets.chomp()

    while !input.to_i().between?(1, headlines.length)
        puts "\nInvalid input. Please try again."
        puts "Choose a headline to read. Input the number beside it. "

        # Print out the headlines
        for i in 1..headlines.length do
            puts "#{i}: #{headlines[i - 1].title}"
        end
        print "Selection: "
        input = gets.chomp()
    end

    "https://news.osu.edu/#{headlines[input.to_i() - 1].link}"
end

