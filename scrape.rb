
#INFORMATION NECESSARY TO RETRIEVE DETAILS:
#actual form ID = OSR_CAT_SRCH,  name is win0
#subject area name =   OSR_CAT_SRCH_WK_DESCR
#catalog number area = OSR_CAT_SRCH_WK_CATALOG_NBR
#choices for catalog = OSR_CAT_SRCH_WK_OSR_EXACT_MATCH1
#course title inside span with ID = OSR_CAT_SRCH_OSR_CRSE_HEADER$0
#credit hours inside span with ID OSR_CAT_SRCH_OSR_UNITS_DESCR$0

require 'mechanize'

mechanize = Mechanize.new

page = mechanize.get('https://registrar.osu.edu/courses/index.asp')

link = page.link_with(text: 'Search Course Catalog')

page = link.click

form = page.forms.first

form['OSR_CAT_SRCH_WK_DESCR'] = 'Computer Science & Engineering'
form['OSR_CAT_SRCH_WK_CATALOG_NBR'] = '3'

page = form.submit

puts page.uri
