class WinesController < ApplicationController
  def index
    @wines = Wine.by_grape
  end

  def show
    @wine = Wine.find(params[:id])
  end

  def new
    @wine = Wine.new
  end

  def create
    @wine = Wine.new(wine_params)
    if @wine.save
      flash[:notice] = "You wine menu item has been created."
      redirect_to wines_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :new
    end
  end

  def edit
    @wine = Wine.find(params[:id])
  end

  def update
    @wine = Wine.find(params[:id])
    if @wine.update(wine_params)
      flash[:notice] = "Wine menu item has been updated!"
      redirect_to wines_path
    else
      flash[:alert] = "Something has gone wrong.."
      render :edit
    end
  end

  def destroy
    @wine = Wine.find(params[:id])
    @wine.destroy
    redirect_to wines_path
  end

  private

  def wine_params
    params.require(:wine).permit(:grape, :price, :image)
  end
end
