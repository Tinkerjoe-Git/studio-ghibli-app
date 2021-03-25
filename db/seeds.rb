require 'faker'
require_relative '../lib/api.rb'
require_relative '../lib/review.rb'
require 'pry'

API.new.get_ghibli_data


Review.all.each do |review|
    review1=Review.create(
        title: review.title,
        content: review.content,
        original_title: review.original_title,
        description: review.description,
        director: review.director,
        release_date: review.release_date,
        rt_score: review.rt_score,
        people: review.people,
        
        
    )

    review1.save
end
binding.pry

5.times do
    User.create(
        name: Faker::Name.name,
        username: Faker::Internet.username,
        password: Faker::Internet.password
    )
end


User.create(name: "Pasta Batman", username: "ghibliboyo",  password: "password")
Review.create(title: "Graveyard of Fireflies is one of SG's most under-rated works", content: "Sample content", original_title: "Come on Fuhuwagaz", user_id: 1 )

  



