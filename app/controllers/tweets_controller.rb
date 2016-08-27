class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :update, :destroy]
  
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end
  
  def new
    if params[:back]
      @tweet = Tweet.new(tweets_params)
    else
      @tweet = Tweet.new
    end
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'Tweet Success!!'
    else
      render action: 'new'
    end
  end

  def confirm
    @tweet = Tweet.new(tweets_params)
    render :new if @tweet.invalid?
  end
  
  def edit
    @tweet = Tweet.find(params[:id])
  end
  
  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
  
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
    
end
