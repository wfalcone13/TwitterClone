class Api::TweetsController < ApplicationController
  before_action :require_sign_in!

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.author_id = current_user.id
    if @tweet.save 
      render :index  
    else
      render json: @tweet.errors.full_messages
    end
  end

  def index
    @tweets = Tweet.all 
  end

  def show
    @tweet = Tweet.find(params[:id])
    render :show 
  end

  def edit
    @tweet = Tweet.find(params[:id])
    render :show 
  end

  def update
    
    @tweet = current_user.tweets.find(params[:id])
    debugger
    if @tweet.update(tweet_params)
      render :show 
    else 
      render json: @tweet.errors.full_messages, status: 422
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    render :index
  end


  private
  def tweet_params
    params(:tweet).permit(:body, :author_id)
  end

end
