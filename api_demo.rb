require "json"
require "open-uri"

# TODO - Let's fetch name and bio from a given GitHub username
url = "https://api.github.com/users/matheusararipe"

# First do the request to the URL

user_serialized = URI.open(url).read

# Parse the response from the API
user = JSON.parse(user_serialized)
# p user

puts "#{user["name"]} - #{user["bio"]} - #{user['avatar_url']}"
