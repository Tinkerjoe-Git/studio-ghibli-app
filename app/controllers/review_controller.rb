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
        @review = Review.find_by(id: params[:id])
        if params.empty?
            flash[:error] = "All fields must be filled in"
            redirect "/reviews/#{@review.id}/edit"
        elsif logged_in? && !params.empty? && current_user.reviews.include?(@review)
            @review.update(title: params[:title],  content: params[:content])
            redirect "/reviews/#{@review.id}" 
        elsif !logged_in?
            flash[:error] = "You must be logged in."
            redirect '/login'
        else
            redirect "/reviews/#{@review.id}/edit"
        end
        
    end

    delete '/reviews/:id' do
        if logged_in?
            @review = Review.find_by_id(params[:id])
            if @review.user == current_user then @review.delete else redirect '/login' end
        else 
            flash[:error] = "You must be logged in."
            redirect '/login'
        end
        redirect '/reviews'
    end
end

#     post '/reviews/search' do
#         @user = current_user
#         @word = params[:search]
#         @reviews = review.where("title LIKE ?", "%#{params[:search]}%")
#         @search = true
#         erb :'reviews/index'
#     end
    
# end

