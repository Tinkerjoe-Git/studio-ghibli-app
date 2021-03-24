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

5.times do
    User.create(
        name: Faker::Name.name,
        username: Faker::Internet.username,
        password: Faker::Internet.password
    )
end




