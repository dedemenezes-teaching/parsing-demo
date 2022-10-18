require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# READ THE CONTENT FROM THE FILE
serialized_beatles = File.read(filepath)
# p serialized_beatles

beatles = JSON.parse(serialized_beatles)
# p beatles
# p beatles["beatles"][1]['first_name'] #=> 'John'
beatles['beatles'].each do |beatle|
  # beatle is this {
  #   "first_name": "John",
  #   "last_name": "Lennon",
  #   "instrument": "Guitar"
  # }
  p beatle['first_name'] #=> will print 'John' on the 1st iteration
end


# STORE CONTENT INTO FILE
beatles = { beatles: [
  {
    first_name: "John",
    last_name: "Lennon",
    instrument: "Guitar"
  },
  {
    first_name: "Paul",
    last_name: "McCartney",
    instrument: "Bass Guitar"
  }
  # etc...
]}

# TIP -> Test the method JSON.generate(beatles) in IRB if necessary
File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beatles))
end
