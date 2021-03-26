class SessionsController < ApplicationController
    ## handles changing my session ie. login/logout

    # IF LOGGED IN, DON'T SHOW LOGIN


    # login route form
    get '/login' do
        redirect_if_logged_in
        # render form
        erb :'sessions/new'
    end

    # login route POST
    post '/login' do
        redirect_if_logged_in
        # take data find User
        user = User.find_by(username: params["username"])

        # if that user is authenticate, log in, redirect /movies
        if user && user.authenticate(params["username"]["password"])
            session["user_id"] = user.id
            redirect "/reviews"
        # if user not valid, send back to /login
        else
            flash[:error] = "Incorrect username or password. Please try again!"
            redirect "/login"
        end
    end

    # logout DELETE (get/post)
    delete '/logout' do
        redirect_if_not_logged_in
        # logout a user
        # session.clear
        session.delete("user_id")
        redirect "/login"
    end
end