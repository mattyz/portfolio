class PortmanteausController < ApplicationController
  def index
    @portfolio_items= Portmanteau.all
  end

  def new
#   @portfolio = Portmanteau.new
   @portmanteau = Portmanteau.new

  end
  def create
    #@portmanteau= Portmanteau.new(portmanteau_params)
    @portmanteau= Portmanteau.new(params.require(:portmanteau).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portmanteau.save
        format.html { redirect_to portmanteaus_path, notice: 'Portfolio item was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end
end
