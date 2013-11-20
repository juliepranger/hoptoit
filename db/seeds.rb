# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#clear out old data
CharityVerifier.destroy_all
NteeCode.destroy_all

#add seed data for charities database
json = ActiveSupport::JSON.decode(File.open('db/charities_seed.json'))

json.each do |org|
  CharityVerifier.create!(org)
end

#add data for NTEE Table
doc = File.open('db/ntee_codes.txt')
doc.each do |line|
  NteeCode.create(
    common_code:line[0],
    core_code:line[0..2],
    description:line[4..255].strip
    )
end