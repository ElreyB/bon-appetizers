class DessertsController < ApplicationController
  def index
    @desserts = Dessert.by_name
    @user = current_user
  end

  def show
    @dessert = Dessert.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @dessert = Dessert.new
  end

  def create
    @dessert = Dessert.new(dessert_params)
    if @dessert.save
      redirect_to desserts_path, notice: "You dessert menu item has been created."
    else
      render :new
    end
  end

  def edit
    @dessert = Dessert.find(params[:id])
  end

  def update
    @dessert = Dessert.find(params[:id])
    if @dessert.update(dessert_params)
      redirect_to desserts_path, notice: "Dessert menu item has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @dessert = Dessert.find(params[:id])
    @dessert.destroy
    redirect_to desserts_path
  end

  private

  def dessert_params
    params.require(:dessert).permit(:name, :image, :description)
  end
end
