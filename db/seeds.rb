# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#CREEAT SAMPLE DATA
#
10.times do |blog|
  Blog.create!([{
    title: " Blog Post #{blog}"},
  { body: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu facilisis lorem. In bibendum eu nisl egestas hendrerit. Praesent volutpat odio at nulla semper, in rhoncus velit pellentesque. Sed maximus nibh vel jus"
  }])
end

puts "created 10 blogs!!"

5.times do |skill|
    Skill.create!([{
    title: " Rails #{skill}"},
    {percent_utilized: 25
    }])
end

puts "created 5 skills !!"

3.times do |portmanteaus|
  Portmanteau.create!([
    { title: " Covid19 #{portmanteaus}"},
    { subtitle: "Activities"},
    { body: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non magna at orci laoreet ultricies vel non justo. Pellentesque ultricies et ante sit amet tempor. Aliquam leo nulla, porttitor non neque id, congue fringilla leo. Aliquam vitae elit semper, luctus massa sed, molestie velit. Morbi aliquet tristique eros a luctus. Nam eu facilisis lorem. In bibendum eu nisl egestas hendrerit. Praesent volutpat odio at nulla semper, in rhoncus velit pellentesque. Sed maximus nibh vel jus"}, 
    { main_image:"http://placehold.it/600x400",},
    { thumb_image:"http://placehold.it/350x200"}
])
end

puts "created 3 portmanteaus akaporfolios !!"
