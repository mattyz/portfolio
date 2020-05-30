class PortmanteausController < ApplicationController
  def index
    @portfolio_items= Portmanteau.all
  end
end
