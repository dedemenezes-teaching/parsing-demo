require "csv"

# TODO - let's read/write data from beatles.csv
# filepath = 'path/to/file.ext
filepath = 'data/beatles.csv'

# READING FROM CSV
CSV.foreach(filepath, headers: :first_row) do |row|
  # Each row is an array of strings
  # p row
  # p "#{row[0]} #{row[1]} plays #{row[2]}"

  # We prefer this one !
  # headers: :first_row => row is kind of a hash -> DUCK TYPING
  # #<CSV::Row "First Name":"John" "Last Name":"Lennon" "Instrument":"Guitar">
  p "#{row['First Name']} #{row['Last Name']} plays #{row['Instrument']}"
end

# John Lennon plays Guitar
# [...]


# STORING INTO CSV

# 1st Example
CSV.open(filepath, 'wb') do |csv|
  csv << ["First Name", "Last Name", "Instrument"]
  csv << ["John", "Lennon", "Guitar"]
  csv << ["Paul", "McCartney", "Bass Guitar"]
  # ...
end

# 2nd Example

students = [
  ['Hermione', 'Granger', 'Griffyndor'],
  ['Draco', 'Malfoy', 'Slytherin']
  # ...
]
CSV.open(filepath, 'wb') do |csv|
  csv << ["First Name", "Last Name", "House"]
  students.each do |student|
    # student = ['Hermione', 'Granger', 'Griffyndor']
    csv << student
  end
end



















# CSV.foreach(filepath) do |row|
#   unless counter.zero?
#     p "#{row[0]} #{row[1]} plays #{row[2]}"
#   end
#   counter += 1
# end
