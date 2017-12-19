class DessertsController < ApplicationController
  def index
    @desserts = Dessert.by_name
  end

  def show
    @dessert = Dessert.find(params[:id])
  end

  def new
    @dessert = Dessert.new
  end

  def create
    @dessert = Dessert.new(dessert_params)
    if @dessert.save
      flash[:notice] = "You dessert menu item has been created."
      redirect_to desserts_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :new
    end
  end

  def edit
    @dessert = Dessert.find(params[:id])
  end

  def update
    @dessert = Dessert.find(params[:id])
    if @dessert.update(dessert_params)
      flash[:notice] = "Dessert menu item has been updated!"
      redirect_to desserts_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
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
    params.require(:dessert).permit(:name, :price, :image)
  end
end
