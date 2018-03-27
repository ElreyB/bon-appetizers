class StylesController < ApplicationController

  def index
    @styles = Style.all
    @user = current_user
  end

  def show
    @style = Style.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @style = Style.new
  end

  def create
    @style = Style.new(style_params)
    if @style.save
      redirect_to styles_path, notice: "Menu Style had been created."
    else
      render :new
    end
  end

  def edit
    @style = Style.find(params[:id])
  end

  def update
    @style = Style.find(params[:id])
    if @style.update(style_params)
      redirect_to styles_path, notice: "Menu Style has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @style = Style.find(params[:id])
    @style.destroy
    redirect_to styles_path
  end

  def style_params
    params.require(:style).permit(:name, :price, :pairing, :description, :image)
  end

end
