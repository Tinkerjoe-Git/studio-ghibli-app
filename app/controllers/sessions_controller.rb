class SessionsController < ApplicationController
    register Sinatra::Flash
    require 'sinatra/flash'
    enable :sessions

    get '/login' do
        @user = User.find_by(:username => params[:username])
        !logged_in? ? (erb :'/sessions/login') : (redirect "/users/#{@user.slug}")
    end

    post "/login" do
        user = User.find_by(:username => params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.slug}"
        else
            flash[:error] = "Incorrect username or password. Please try again!"
            redirect "/login"
        end
    end

    delete "/logout" do
        if logged_in? 
            session.delete("user_id")
            redirect '/login' 
        else
            flash[:error] = "Something went wrong. Please try again!"
            redirect "/"
        end
    end


end
