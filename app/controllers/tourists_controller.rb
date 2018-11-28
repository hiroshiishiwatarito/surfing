class TouristsController < ApplicationController
  def show
		
  end

  def done
  end

  def index
  	@tourists = Tourist.all
  end

  def infos
  end

end
