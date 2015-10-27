class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update]
  load_and_authorize_resource

  # GET /pages
  # GET /pages.json
  def index
    banners = BannerPosition.where(description: '首页轮播')
    if banners.present?
      carousel_banner_position = banners.first
      @carousel_banners = Banner.where(banner_position_id: carousel_banner_position.id)
      @carousel_banner_width = carousel_banner_position.size.split('x').first
      @carousel_banner_height = carousel_banner_position.size.split('x').last
    end

    banners = BannerPosition.where(description: '首页滑动')
    if banners.present?
      slide_banner_position = banners.first
      @slide_banners = Banner.where(banner_position_id: slide_banner_position.id)
      @slide_banner_width = slide_banner_position.size.split('x').first
      @slide_banner_height = slide_banner_position.size.split('x').last
    end
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
  end

  # GET /pages/1/edit
  # GET /pages/1/edit.json
  def edit
  end

  def update
    @page.update(page_params)
    redirect_to action: :show
  end

  private

    def set_page
      @page = Page.find_by_uid(params[:uid])
      not_found if @page.blank?
    end

    def page_params
      params.require(:page).permit(:content)
    end

end
