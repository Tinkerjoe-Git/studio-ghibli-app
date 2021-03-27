class GhibliController < ApplicationController

    get '/ghiblis' do

        @ghiblis = Ghibli.all
        erb :'ghiblis/index'
    end

    ##Lets try and have the dropdown show all the film titles in english, and make those all hrefs
    ##Then the user clicks the href and it takes them to the films details

    get '/ghiblis/deets'do
        @ghibli = Ghibli.find_by(:title => params[:title])
        erb :'ghiblis/deets'
    end
end
