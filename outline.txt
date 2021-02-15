=begin
def pull_html
pull the course catalog page which is the one we want scraped

require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('http://websitewewanttopull.com/')

puts page.title
end
=end

=begin
def read_html
    read the html file's contents using mechanize
end
 =end
 
 =begin
 def fill_form
  input into the text boxes for the coures catalog and hit search
 end
  =end
  
  =begin
  def present
    presenting the data in a text file via table
    extra: make html where user can pick what data they want to see
    present in table:
    the name of the cse class
    the number of credit hours
    the course attributes
  end
 =end
