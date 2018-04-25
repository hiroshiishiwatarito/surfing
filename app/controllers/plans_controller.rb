class PlansController < ApplicationController

	before_action :move_to_index, except: :index

	def index
		@plans = Plan.includes(:guider).page(params[:page]).per(5).order("created_at DESC")
	end

	def new
	end

	def create
		Plan.create(image: params[:image], title: params[:title], contents: params[:contents], times: params[:times], datetimes: params[:datetimes], guider_id: current_guider.id)
	end

	def destroy
		plan = Plan.find(params[:id])
		plan.destroy if plan.guider_id == current_guider.id
	end

	def edit
		@plan = Plan.find(params[:id])
	end

	def update
        plan = Plan.find(params[:id])
        if plan.guider_id == current_guider.id
        	plan.update(plan_params)
        end
    end

    def show
    	@plan = Plan.find(params[:id])
    end

	private
	def plan_params
		params.permit(:image, :title, :contents, :time, :datetimes,)
	end

	def move_to_index
		redirect_to action: :index unless guider_signed_in?
	end
end
