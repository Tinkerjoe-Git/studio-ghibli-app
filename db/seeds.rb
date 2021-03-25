require 'faker'
require_relative '../lib/api.rb'
require_relative '../lib/ghibli-data.rb'

API.new.get_ghibli_data


GhibliData.all.each do |film|
    film1=Ghibli.create(
        title: film.title,
        original_title: film.original_title,
        description: film.description,
        director: film.director,
        release_date: film.release_date,
        rt_score: film.rt_score,
        people: film.people
        
    )

    film1.save
end

4.times do
    User.create(
        name: Faker::Name.name,
        username: Faker::Internet.username,
        password: Faker::Internet.password
    )
end

User.create(name: "Pasta Batman", username: "ghibliboyo",  password: "password")
Review.create(title: "Graveyard of Fireflies is one of SG's most under-rated works", content: "Sample content", user_id: 1 )

4.times do
    Review.create(
        title: Faker::Lorem.sentence,
        content: Faker::Lorem.paragraph,
        user_id: Faker::Number.digit

    )
end

###Lets run a User.all and make sure everything works, then tackle outstanding Review and / @review issues on the site.


