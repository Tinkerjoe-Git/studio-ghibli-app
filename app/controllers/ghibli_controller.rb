class GhibliController < ApplicationController

    get '/ghiblis' do
        redirect_if_not_logged_in

        @ghiblis = Ghibli.all
        erb :'ghiblis/index'
    end
end
