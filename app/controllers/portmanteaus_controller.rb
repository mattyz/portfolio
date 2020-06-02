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

  def edit
    @portmanteau = Portmanteau.find(params[:id])
    # puts @portmanteau.inspect
  end

  def show
    @portmanteau = Portmanteau.find(params[:id])
  end

  def destroy
    @portmanteau = Portmanteau.find(params[:id])
    @portmanteau.destroy
    respond_to do |format|
      format.html { redirect_to portmanteaus_url, notice: 'Portfolio was successfully destroyed.' }
    end
  end

  def update
    @portmanteau= Portmanteau.new(params.require(:portmanteau).permit(:title, :subtitle, :body))
    respond_to do |format|
      if @portmanteau.update(params.require(:portmanteau).permit(:title, :subtitle, :body))
        format.html { redirect_to portmanteaus_path, notice: 'Portfolio was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
end
