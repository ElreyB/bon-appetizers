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
      flash[:notice] = "You bit menu item has been created."
      redirect_to bits_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :new
    end
  end

  def edit
    @bit = Bit.find(params[:id])
  end

  def update
    @bit = Bit.find(params[:id])
    if @bit.update(bit_params)
      flash[:notice] = "Bit menu item has been updated!"
      redirect_to bits_path
    else
      flash[:alert] = "Something has gone wrong.."
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
