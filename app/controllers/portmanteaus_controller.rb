class PortmanteausController < ApplicationController
  before_action :set_portmanteau, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "portmanteau"
  # access all: [:show, :index], user: {except: [:destroy, :sort, :new, :create, :update, :edit]}, site_admin: :all
  access all: [:show, :index, :update, :new, :edit, :sort], user: {except: [:destroy]}, site_admin: :all

  def index
    # @portfolio_items= Portmanteau.all
   #  @portmanteaus = Portmanteau.all
#     @portmanteaus = Portmanteau.order("position ASC")
    @portmanteaus = Portmanteau.by_position
    @page_title = "My Portmanteau | Portfolio Section"

  end

  # not implemented on client yet..webpacker issue
  def sort
    params[:order].each do |key, value|
      Portmanteau.find(value[:id]).update(position: value[:position])
    end
    render nothing: true
  end

  def new
#   @portfolio = Portmanteau.new
   @portmanteau = Portmanteau.new
   #used for nested attr
#   3.times {@portmanteau.technologies.build }
  end
  
  def create
    @portmanteau= Portmanteau.new(portmanteau_params)
    # @portmanteau= Portmanteau.new(params.require( :portmanteau).permit(g
    #  :title, :subtitle, :body,technologies_attributes: [:name]))
    respond_to do |format|
      if @portmanteau.save
        format.html { redirect_to portmanteaus_path, notice: 'Your portfolio is now live' }
      else
        format.html { render :new, notice: 'Saving Portmanteau failed!' }
      end
    end
  end

  def edit
    # puts @portmanteau.inspect
  end

  def show
  end

  def destroy
    @portmanteau.destroy
    respond_to do |format|
      format.html { redirect_to portmanteaus_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  def update
    respond_to do |format|
      if @portmanteau.update(portmanteau_params)
        format.html { redirect_to portmanteaus_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def tech_news
   @tweets = SocialTool.twitter_search
end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portmanteau
      @portmanteau = Portmanteau.find(params[:id])
    end

    def portmanteau_params
      params.require(:portmanteau).permit(:title,
                                          :subtitle,
                                          :body,
                                          :main_image,
                                          :thumb_image,
                                          technologies_attributes: [:id,:name, :_destroy])
    end

end
