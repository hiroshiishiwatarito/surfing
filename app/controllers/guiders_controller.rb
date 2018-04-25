class GuidersController < ApplicationController
	def show
		@nickname = current_guider.nickname
		@plans    = current_guider.plans.page(params[:page]).per(5).order("created_at DESC")
	end
	
end
