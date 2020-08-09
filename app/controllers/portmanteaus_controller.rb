class PortmanteausController < ApplicationController
  before_action :set_portmanteau, only: [:show, :edit, :update, :destroy]
  layout "portmanteau"

  def index
    # @portfolio_items= Portmanteau.all
    @portmanteaus = Portmanteau.all
  end

  def new
#   @portfolio = Portmanteau.new
   @portmanteau = Portmanteau.new
   #used for nested attr
   3.times {@portmanteau.technologies.build }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_portmanteau
      @portmanteau = Portmanteau.find(params[:id])
    end

    def portmanteau_params
      params.require(:portmanteau).permit(:title, :subtitle, :body,technologies_attributes: [:name])
    end

end
