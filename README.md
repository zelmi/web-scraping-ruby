# Web Scraping
This project deals with scraping information from a news article on the OSU News Room wesbite.
## Installation

Installing Ruby and the Mechanize gem is required to run this project. Enter the following commands into your terminal to install Ruby.

```bash
$sudo apt install zlib1g-dev build-essential libssl-dev libreadline-dev
libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev  libcurl4-openssl-dev
software-properties-common libffi-dev

$rbenv install 2.6.6 # this step takes several minutes

$rbenv global 2.6.6  # set default ruby version

$ruby -v # confirm it works

Afterwards, to install Mechanize,

$gem install mechanize
```
## Requires
Ruby gem Mechanize

## Design
mapped_choices holds an array of string that are inserted into a url string to direct the user to the desired webpage. input is the integer the user inputs for the desired category/article they wish to access. The program continues prompting the user for an integer until a valid integer is input. page is the html page retrieved using mechanize. The program uses page to enter the category on the OSU news room site the user chooses and then the article within that category the user selects.
  
## How to use this program

To run the program, enter:

```
$ruby lib/scrape.rb
```

The program will prompt you to pick a category you would like to read the news about. Input the number beside the category you wish to view the articles for.
The program will then ask you which article you would like to read. Input the number beside the article. The program will put the article's contents into a text file which you can access and read. After printing the article, the program will ask if the user would like to read another article. If the user types "no" or "No" as input, then the program will terminate. Otherwise, if the user hits any other key, the program will rerun and ask the user to pick a category again.


## Testing

In order to test the game in the "tests" section, delete the start_games function call at the bottom of lib/set.rb. Else, the game will run and tests won't.

To test, run

```
$ ruby tests/scrape_test.rb
```

## Contributions

### Team: //Todo: Make team name

Esther Hu

Evan Hubert

Zehur Elmi

Nick Springer
