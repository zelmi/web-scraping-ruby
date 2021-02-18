# Web Scraping
This project deals with scraping information from a news article on the OSU News Room wesbite. News article will be printed to markdown file.
## Installation

Installing Ruby and the Mechanize gem is required to run this project. Enter the following commands into your terminal to install Ruby.

```bash
$sudo apt install zlib1g-dev build-essential libssl-dev libreadline-dev
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev  libcurl4-openssl-dev
software-properties-common libffi-dev

$rbenv install 2.6.6 # this step takes several minutes

$rbenv global 2.6.6  # set default ruby version

$ruby -v # confirm it works
```
Afterwards, to install Mechanize,
```bash
$gem install mechanize
```
## Requires
Ruby gem Mechanize

## Design
mapped_choices holds an array of strings that are inserted into a url to direct the user to the desired webpage. input is the integer the user inputs for the desired category/article they wish to access. The program continues prompting the user for an integer until a valid integer is input. page is the html page retrieved using mechanize. The program uses page to enter the category on the OSU news room site the user chooses and then the article within that category the user selects. The methods are placed into separate ruby files; the Headline class in headline.rb stores the title of the headline article and the link to it. get_type_of_stories_link in get_type_of_stories_link.rb gets user input for the category number they picked and returns that category's url. prompt in prompt.rb prints the message passed into the method and then receives the input from that message. get_headline_link_from_user in  get_headline_link_from_user.rb gets the headline links and titles from the passed-in headline array and prompts the user to pick the number of the article they wish to read, returning the link to the article the user picked . scraper.rb uses all of these files to prompt the user to pick a category, stores the articles in that category into an array, prompts the user to pick an article after printing out the article titles, then gets the link to that article and prints out the article's contents in a separate markdown file.
  
## How to use this program

To run the program, enter:

```
$ruby lib/scraper.rb
```

The program will prompt you to pick a category you would like to read the news about. Input the number beside the category you wish to view the articles for.
The program will then ask you which article you would like to read. Input the number beside the article. The program will put the article's contents into a text file which you can access and read. After printing the article, the program will ask if the user would like to read another article. If the user types "n" or "N" as input, then the program will terminate. Otherwise, if the user hits any other key, the program will rerun and ask the user to pick a category again.

Note that markdown file will be overwritten whenever user chooses to read an article.


## Testing

The test file contains tests for different functions used in various locations throughout the program.

To test, run

```
$ ruby tests/scraper_tests.rb
```

## Contributors

### Team: //Todo: Make team name

Esther Hu

Evan Hubert

Zehur Elmi

Nick Springer
