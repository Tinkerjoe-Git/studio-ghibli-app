
require './config/environment'
require 'sinatra/flash'
class ApplicationController < Sinatra::Base


  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    register Sinatra::Flash
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
  end

  get '/' do
    #flash[:notice] = "Hooray, Flash is working!"
    erb :index
  end  

  
  get '/search' do
    @ghibli = Ghibli.find_by(title: params["title"])
    erb :results
  end
    
  helpers do
        def current_user
            @current_user ||= User.find_by_id(session["user_id"])
        end

        def logged_in?
            !!current_user
        end

        def redirect_if_not_logged_in
            redirect "/login" if !logged_in?
        end

        def redirect_if_logged_in
            redirect "/reviews" if logged_in?
        end
    end
end



  
