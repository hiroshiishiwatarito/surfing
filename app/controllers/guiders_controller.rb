class GuidersController < ApplicationController

	def show
		@nickname = current_guider.nickname
		@plans    = current_guider.plans.page(params[:page]).per(5).order("created_at DESC")
		@guiders  = Guider.find(params[:id])
	end

	def go
	end

	def done
	end
	
	def index
    	@guider = Guider.all
    end
    
	def new

	end

	def create
		Guider.create(student_name: params[:student_name], Image: params[:Image], university: params[:university], year: params[:year], hometown: params[:hometown], message: params[:message], contact: params[:contact], lastname: params[:lastname])
    end

	def edit
		@guiders   = Guider.find(params[:id])
	end

	def update
		guiders  = Guider.find(params[:id])
        guiders.update(guider_params)
	end

	private
    def guider_params
    	params.permit(:student_name, :Image, :university, :year, :hometown, :message, :contact, :lastname)
    end

end
