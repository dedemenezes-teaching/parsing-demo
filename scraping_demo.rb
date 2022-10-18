require "open-uri"
require "nokogiri"

# Let's scrape recipes from https://www.bbcgoodfood.com

url = 'https://www.bbcgoodfood.com/search?q=teryiaky+chicken'

# Make the request and get the response
html_file = URI.open(url).read
# Parsing the html into Nokogiri Objects
html_doc = Nokogiri::HTML(html_file)
# Inspect HTML on the browser and find the 'class' for the HTML element you want to search
# and pass it as an argument to the search method
html_doc.search('.standard-card-new__article-title').each do |element|
  p element.text.strip
  p element.attribute('href').value
end
