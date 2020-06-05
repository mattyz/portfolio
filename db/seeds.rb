# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
#CREATE SAMPLE DATA
#

 3.times do |topic|
  t =Topic.new( title: "Topic #{topic}")
  t.save!
 end

 5.times do |blog|
   b = Blog.new( title: "Blog Post #{blog}",  body:' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam eu facilisis lorem. In bibendum eu nisl egestas hendrerit. Praesent volutpat odio at nulla semper, in rhoncus velit pellentesque. Sed maximus nibh vel jus', topic_id: Topic.last.id )
  b.save!
 end
 puts "created 3 topics!!"

 5.times do |skill|
    val = 5 * ("#{skill}".to_i)
    s = Skill.new( title: " Rails #{skill}", percent_utilized: val)
    s.save!
 end

puts "created 5 skills !!"

 5.times do |portmanteaus|
  p = Portmanteau.new( title: " Covid19 #{portmanteaus}", subtitle: "Activities",
     body: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non magna at orci laoreet ultricies vel non justo. Pellentesque ultricies et ante sit amet tempor. Aliquam leo nulla, porttitor non neque id, congue fringilla leo. Aliquam vitae elit semper, luctus massa sed, molestie velit. Morbi aliquet tristique eros a luctus. Nam eu facilisis lorem. In bibendum eu nisl egestas hendrerit. Praesent volutpat odio at nulla semper, in rhoncus velit pellentesque. Sed maximus nibh vel jus", 
     main_image: "http://placehold.it/600x400",
     thumb_image: "http://placehold.it/350x200")
  p.save!
 end

 1.times do |portmanteaus|
  p = Portmanteau.new( title: " Portmanteau-Portfolio#{portmanteaus}", subtitle: "Adventures",
     body: " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean non magna at orci laoreet ultricies vel non justo. Pellentesque ultricies et ante sit amet tempor. Aliquam leo nulla, porttitor non neque id, congue fringilla leo. Aliquam vitae elit semper, luctus massa sed, molestie velit. Morbi aliquet tristique eros a luctus. Nam eu facilisis lorem. In bibendum eu nisl egestas hendrerit. Praesent volutpat odio at nulla semper, in rhoncus velit pellentesque. Sed maximus nibh vel jus", 
     main_image: "http://placehold.it/600x400",
     thumb_image: "http://placehold.it/350x200")
  p.save!
 end

puts "created 5 portmanteaus aka porfolios !!"
