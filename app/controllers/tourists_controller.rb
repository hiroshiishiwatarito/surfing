class TouristsController < ApplicationController
  def show
		
  end

  def done
  end

  def index
  	@tourists = Tourist.all
  	@chat = Chat.new
  end

  def infos
  end

end
