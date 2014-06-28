# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Word.delete_all
counter = 0
until counter == 500
  word = SecureRandom.urlsafe_base64 8

  unless Word.find_by_word_str word
    Word.create(word_str: word)
    counter += 1
  end
end
