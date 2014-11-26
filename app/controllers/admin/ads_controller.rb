class Admin::AdsController < Admin::BaseController
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
  end

  def create
    params.permit!
    @ad = Ad.create(params[:ad])
  end

  def edit
    
  end

  def destroy
    
  end

  def update
    
  end

  private

  def find_ad
    @ad = Ad.find_by(id: params[:id])
  end

  def ad_params
    params.require(:ad).permit!
  end

end
