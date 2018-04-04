class ReviewsController < ApplicationController

  def index
    @user = current_user
    @reviews = Review.all
    @reviews_by_date = Review.by_date
    @reviews_by_rating = Review.by_rating
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

  def destroy
    @review = Review.find(params[:id])
    @event = Event.find(@review.event_id)
    @review.destroy
    redirect_to event_path(@event)
  end

private

  def review_params
    params.require(:review).permit(:rating, :reviewer, :body, :event_id)
  end
end
