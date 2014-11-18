# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
def dot
	print "."
end


User.create(email: "bv@dog.com", password: "12345qwerty", password_confirmation: "12345qwerty")

def create_task(title, done = false)
  task = Task.find_or_create_by(title: title)
  task.done = done
  task.user = User.where(email: "bv@dog.com").first
  task.save
  dot
end

puts ""
print "Seeding data"
create_task("Clean the board")
create_task("Get a maid")
puts "Seeding done!"