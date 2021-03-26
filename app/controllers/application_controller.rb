
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
    
    def current_user
      @current_user ||= User.find_by_id(session["user_id"])
    end
  
    helpers do
      def logged_in?
        !!current_user          ####!!session[:user_id]
      end
  
      # def current_user
      #   User.find(session[:user_id])
      # end
    end
  
end