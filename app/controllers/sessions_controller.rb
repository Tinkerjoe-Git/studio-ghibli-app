class SessionsController < ApplicationController
    register Sinatra::Flash
    

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

    get "/logout" do
        if logged_in? 
            session.delete("user_id")
            redirect "/"
        else
            flash[:error] = "Something went wrong. Please try again!"
            redirect "/"
        end
    end


end

