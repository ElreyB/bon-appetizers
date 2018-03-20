class MainsController < ApplicationController
  def index
    @mains = Main.by_name
  end

  def show
    @main = Main.find(params[:id])
    respond_to do |format|
      format.html { }
      format.js { }
    end
  end

  def new
    @main = Main.new
  end

  def create
    @main = Main.new(main_params)
    if @main.save
      flash[:notice] = "You main menu item has been created."
      redirect_to mains_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :new
    end
  end

  def edit
    @main = Main.find(params[:id])
  end

  def update
    @main = Main.find(params[:id])
    if @main.update(main_params)
      flash[:notice] = "Main menu item has been updated!"
      redirect_to mains_path
    else
      flash[:alert] = "Something has gone wrong.."
      render :edit
    end
  end

  def destroy
    @main = Main.find(params[:id])
    @main.destroy
    redirect_to mains_path
  end

  private

  def main_params
    params.require(:main).permit(:name, :image, :description)
  end
end
