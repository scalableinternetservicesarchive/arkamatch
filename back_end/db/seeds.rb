# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

interests=['Basketball','Video games','Baseball','Tennis','Surfing','Skateboarding', 'Programming']
number_of_interests = [2,3,4]
require 'csv'
csv_text = File.read(Rails.root.join('lib','seeds', 'users_sample.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
timeNow = Time.now
sql = "INSERT INTO users (username, email, encrypted_password, created_at, updated_at) VALUES "
csv.each_with_index do | row, index | 
  if index == 0
    sql += "( '#{row['username']}', '#{row['email_prefix']}@bogus.com', '#{row['password']}', '#{timeNow}', '#{timeNow}')"  
  else
    sql += ",( '#{row['username']}', '#{row['email_prefix']}@bogus.com', '#{row['password']}', '#{timeNow}', '#{timeNow}')"
  end 
end 
sql += ';'
# puts sql 
results = ActiveRecord::Base.connection.execute(sql)
puts results
# csv.each do | row |
#   user = User.create! :username => row['username'],
#                      :email => row['email_prefix']+"@bogus.com",
#                       :password =>  row['password'],
#                       :password_confirmation => row['password']

#   if row['username'] != "system_admin"
#     random_interests = interests.sample(number_of_interests.sample(1)[0])
#     random_interests.each do |interest|
#       preference = UserPreference.create! :name => row['username'], :interest => interest
#     end
#   end
# end