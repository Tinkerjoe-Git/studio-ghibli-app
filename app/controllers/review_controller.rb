class ReviewController < ApplicationController

    get '/reviews' do 
        if logged_in?
            @reviews = current_user.reviews
            erb :'/reviews/index'
        else
            redirect '/login'
        end
    end

    get '/reviews/new' do
        if logged_in?
            #@review = Review.new
            erb :'/reviews/create'
        else 
            redirect '/login'
        end
    end


    post '/reviews' do
        @user = User.find(session[:user_id])
        current_user = @user
        if params[:review] == nil
            flash[:error] = "Your review could not be saved. Try again!"
            redirect '/reviews/new'
        elsif !params.empty?
            review = current_user.reviews.build(params[:review])
        end
        if review.valid?
            review.save
            flash[:message] = "Successfully posted review."
            redirect "/users/#{@user.slug}"
        else
            flash[:message] = "review was invalid. Please try again."
            redirect '/reviews/new'
        end
    end

    get '/reviews/:id' do
        if logged_in?
            @review = Review.find_by_id(params[:id])
            flash[:message] = "Success, here it is"
            erb :"/reviews/show"
        else 
            flash[:error] = "You must be logged in to view reviews."
            redirect '/login'
        end
    end

    get '/reviews/:id/edit' do 
        @review = Review.find_by(id: params[:id])
        if logged_in? && current_user.reviews.include?(@review)
            erb :'/reviews/edit'
        else 
            flash[:error] = "You must be logged in to edit a review."
            redirect '/login'
        end
    end

    patch '/reviews/:id' do
        redirect_if_not_logged_in
        redict_if_not_authorized
        if @review.update(params[:review])
            redirect "/reviews/#{@review.id}" 
        else
            redirect "/reviews/#{@review.id}/edit"
        end
    end

    delete '/reviews/:id' do

        redirect_if_not_logged_in

        redirect_if_not_authorized

        @movie.destroy

        redirect "/movies"
    end

    private

    def redirect_if_not_authorized
        @review = Review.find_by_id(params[:id])
        if @review.user_id != current_user.id
            redirect "/reviews"
        end
    end
   

    post '/reviews/search' do
        @user = current_user
        @word = params[:search]
        @reviews = Review.where("title LIKE ?", "%#{params[:search]}%")
        @search = true
        erb :'reviews/index'
    end
        
end

