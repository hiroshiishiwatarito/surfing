class GuidersController < ApplicationController

    before_action :move_to_index, except: [:approve_guider, :accepted]

	def show
		@nickname = current_guider.nickname
		@plans    = current_guider.plans.page(params[:page]).per(8).order("created_at DESC")
		@guiders  = Guider.find(params[:id])
		@tests    = current_guider.tests.page(params[:page]).per(8).order("created_at DESC")
	end

	def go
	end

	def done
	end
	
	def index
        @guiders = Guider.all
        
    end

    def approve_guider
    	guider = Guider.find(params[:id])
    	guider.approved = true
    	if guider.save
    		redirect_to plans_path
        end
    end

	def new

	end

	def create
		Guider.create(student_name: params[:student_name], photo: params[:photo], driver: params[:driver], Image: params[:Image], university: params[:university], faculty: params[:faculty], year: params[:year], birth: params[:birth], gender: params[:gender], hometown: params[:hometown], message: params[:message], contact: params[:contact], lastname: params[:lastname], occupation: params[:occupation])
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
    	params.permit(:student_name, :Image, :driver, :photo, :university, :year, :hometown, :message, :contact, :lastname, :faculty, :birth, :occupation, :gender)
    end


    def move_to_index
            redirect_to action: :index unless guider_signed_in?
    end

end
