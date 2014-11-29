class Admin::SliderController < Admin::BaseController
  before_action :find_slider, only: [:show, :edit, :update, :destroy]
  def index
    @q = Ad.search(params[:q])
    if params[:q] != nil
      @sliders = @q.result  
    else
      @sliders = Ad.where(:ad_type => "carousel").page(params[:page])
    end
  end

  def new
    @slider = Ad.new
  end

  def create
    @slider = Ad.new(slider_params)
    @slider.ad_type = "carousel"
    if @slider.save
      redirect_to admin_slider_path(@slider)
    else
      render "new"
    end
  end

  def edit
    
  end

  def destroy
    if @slider.destroy
      redirect_to admin_sliders_path
    else
      redirect_to admin_sliders_path
    end
  end

  def update
    @slider.update(slider_params)
    if @slider.save
      redirect_to admin_slider_path(@slider)
    else
      render "edit"
    end
  end

  def search
    index
    render :index
  end

  private

  def find_slider
    @slider = Ad.find_by(id: params[:id])
  end

  def slider_params
    params.require(:slider).permit!
  end

end
