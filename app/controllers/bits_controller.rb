class BitsController < ApplicationController
  def index
    @bits = Bit.by_name
    @user = current_user
  end

  def show
    @bit = Bit.find(params[:id])
  end

  def new
    @bit = Bit.new
  end

  def create
    @bit = Bit.new(bit_params)
    if @bit.save
      redirect_to bits_path, notice: "You Bit menu item has been created."
    else
      render :new
    end
  end

  def edit
    @bit = Bit.find(params[:id])
  end

  def update
    @bit = Bit.find(params[:id])
    if @bit.update(bit_params)
      redirect_to bits_path, notice: "Bit menu item has been updated!"
    else
      render :edit
    end
  end

  def destroy
    @bit = Bit.find(params[:id])
    @bit.destroy
    redirect_to bits_path
  end

  private

  def bit_params
    params.require(:bit).permit(:name, :image)
  end
end
