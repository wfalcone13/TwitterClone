class Api::LikesController < ApplicationController
  before_action :require_sign_in!

  def create
    like = Like.new()
    like.user_id = current_user.id 
    like.tweet_id = params[:tweet_id]
    like.save 
    flash[:erros] = like.errors.full_messages
    redirect_to api_tweets_url
  end

  def destroy
    like = Tweet.find(params[:id])
    like.destroy
    redirect_to api_tweets_url
  end

  private
 

end