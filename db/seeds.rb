require 'faker'

10.times do |i|
  Event.create({
    :date => Date.today + i,
    :title => "Event #{i}",
    :organizer_name => "Organizer #{i}",
    :organizer_email => "organizer_#{i}@example.com" })
end

(11).upto(16) do |i|
  Event.create({
    :date => Date.today + i,
    :title => "#{Faker::Company.name}",
    :organizer_name => "#{Faker::Name.name} #{i}",
    :organizer_email => "#{Faker::Internet.email}" })
end
