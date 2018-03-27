class PastaDishesController < ApplicationController
  def index
    @pasta_dishes = PastaDish.by_name
    @user = current_user
  end

  def show
    @pasta_dish = PastaDish.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @pasta_dish = PastaDish.new
  end

  def create
    @pasta_dish = PastaDish.new(pasta_dish_params)
    if @pasta_dish.save
      flash[:notice] =
      redirect_to pasta_dishes_path, notice: "Pasta menu item has been created."
    else
      render :new
    end
  end

  def edit
    @pasta_dish = PastaDish.find(params[:id])
  end

  def update
    @pasta_dish = PastaDish.find(params[:id])
    if @pasta_dish.update(pasta_dish_params)
      redirect_to pasta_dishes_path, notice: "Pasta menu item has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @pasta_dish = PastaDish.find(params[:id])
    @pasta_dish.destroy
    redirect_to pasta_dishes_path
  end

  private

  def pasta_dish_params
    params.require(:pasta_dish).permit(:name, :image, :description)
  end
end
