class Admin::AdsController < Admin::BaseController
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  def index
    @ads = Ad.all
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.create(ad_params)
  end

  def edit
    
  end

  def destroy
    
  end

  def update
    @ad.update(ad_params)
  end

  private

  def find_ad
    @ad = Ad.find_by(id: params[:id])
  end

  def ad_params
    params.require(:ad).permit!
  end

end
