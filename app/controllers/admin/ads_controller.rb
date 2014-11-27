class Admin::AdsController < Admin::BaseController
  before_action :find_ad, only: [:show, :edit, :update, :destroy]
  def index
    @q = Ad.search(params[:q])
    @ads = @q.result
  end

  def new
    @ad = Ad.new
  end

  def create
    @ad = Ad.new(ad_params)
    @ad.ad_type = "carousel"
    if @ad.save
      redirect_to admin_ad_path(@ad)
    else
      render "new"
    end
  end

  def edit
    
  end

  def destroy
    if @ad.destroy
      redirect_to admin_ads_path
    else
      redirect_to admin_ads_path
    end
  end

  def update
    @ad.update(ad_params)
    if @ad.save
      redirect_to admin_ad_path(@ad)
    else
      render "edit"
    end
  end

  def search
    index
    render :index
  end

  private

  def find_ad
    @ad = Ad.find_by(id: params[:id])
  end

  def ad_params
    params.require(:ad).permit!
  end

end
