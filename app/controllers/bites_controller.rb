class BitesController < ApplicationController
  def index
    @bites = Bite.by_name
    @user = current_user
  end

  def show
    @bite = Bite.find(params[:id])
  end

  def new
    @bite = Bite.new
  end

  def create
    @bite = Bite.new(bite_params)
    if @bite.save
      redirect_to bites_path, notice: "You Bite menu item has been created."
    else
      render :new
    end
  end

  def edit
    @bite = Bite.find(params[:id])
  end

  def update
    @bite = Bite.find(params[:id])
    if @bite.update(bite_params)
      redirect_to bites_path, notice: "Bite menu item has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @bite = Bite.find(params[:id])
    @bite.destroy
    redirect_to bites_path
  end

  private

  def bite_params
    params.require(:bite).permit(:name, :image)
  end
end
