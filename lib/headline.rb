# Holds information for each Headline
class Headline
    attr_accessor :title, :link

    def initialize(title, link)
        @title = title
        @link = link
    end
end
