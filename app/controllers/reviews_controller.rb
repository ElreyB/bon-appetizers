class ReviewsController < ApplicationController

  def index
    @user = current_user
    @reviews = Review.all
  end

  def show
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
  end

  def new
    @event = Event.find(params[:event_id])
    @review = Review.new
  end

  def create
    @event = Event.find(params[:event_id])
    @review = @event.reviews.new(review_params)
    if @review.save
      redirect_to event_path(@event), notice: "Your review has been added. Thank you!"
    else
      render :new
    end
  end

  def edit
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
  end

  def update
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
    if @review.update
      redirect_to event_path(@event), notice: "Review has be updated!"
    else
      render :edit
    end
  end

  def destory
    @event = Event.find(params[:event_id])
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to event_path(@event)
  end

private

  def review_params
    params.require(:review).permit(:rating, :reviewer, :body)
  end
end
