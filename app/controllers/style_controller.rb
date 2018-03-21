class StyleController < ApplicationController

  def index
    @styles = Style.all
  end

  def show
    @style = Style.find(params[:id])
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      flash[:notice] = "Menu style had been created."
      redirect_to styles_path
    else
      flash[:alert] = "Something has gone wrong..."
      render new
    end
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    if @style.update(style_params)
      flash[:notice] = "Menu Style has been updated!"
      redirect_to styles_path
    else
      flash[:notice] = "Something went wrong.."
      render :edit
    end
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    redirect_to styles_path
  end

  def style_params
    params.requrie(:style).permit(:name, :price, :pairing)
  end

end
