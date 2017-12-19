class AntipastisController <  ApplicationController
  def index
    @antipastis = Antipasti.by_name
  end

  def show
    @antipasti = Antipasti.find(params[:id])
  end

  def new
    @antipasti = Antipasti.new
  end

  def create
    @antipasti = Antipasti.new(antipasti_params)
    if @antipasti.save
      flash[:notice] = "You antipasti menu item has been created."
      redirect_to antipastis_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :new
    end
  end

  def edit
    @antipasti = Antipasti.find(params[:id])
  end

  def update
    @antipasti = Antipasti.find(params[:id])
    if @antipasti.update(antipasti_params)
      flash[:notice] = "Antipasti menu item has been updated!"
      redirect_to antipastis_path
    else
      flash[:alert] = "Soemthing has gone wrong.."
      render :edit
    end
  end

  def destroy
    @antipasti = Antipasti.find(params[:id])
    @antipasti.destroy
    redirect_to antipastis_path
  end

  private

  def antipasti_params
    params.require(:antipasti).permit(:name, :price, :image)
  end
end
