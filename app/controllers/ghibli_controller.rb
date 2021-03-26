class GhibliController < ApplicationController

    get '/ghiblis' do

        @ghiblis = Ghibli.all
        erb :'ghiblis/index'
    end
end
