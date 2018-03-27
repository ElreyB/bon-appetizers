class MainsController < ApplicationController
  def index
    @mains = Main.by_name
    @user = current_user
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
      redirect_to mains_path, notice: "You main menu item has been created."
    else
      render :new
    end
  end

  def edit
    @main = Main.find(params[:id])
  end

  def update
    @main = Main.find(params[:id])
    if @main.update(main_params)
      redirect_to mains_path, notice: "Main menu item has been updated!"
    else
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
