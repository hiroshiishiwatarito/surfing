class PlansController < ApplicationController

	require 'payjp'

	before_action :move_to_index, except: [:index, :show, :category, :next, :tokyo, :kyoto]

	def index

 	       @plans = Plan.where(["(times LIKE ?) OR (title LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(20).order("created_at DESC")
           @search_keyword = params[:search]
    end

    def pay

        Payjp.api_key = 'sk_live_157b4609bed3c98d179f5f1e9ba0e9eb2ef8def128891e5bc9634b14'

        charge = Payjp::Charge.create(
            :currency => 'jpy',
            :amount => 500,
            :card => params['payjp-token']
            )
        GuiderMailer.guider_payment_mail(self).deliver_now

    end

	def new
	end

	def create
		Plan.create(place: params[:place], image: params[:image], copy_image: params[:copy_image], third_image: params[:third_image], fourth_image: params[:fourth_image], five_image: params[:five_image], title: params[:title], contents: params[:contents], times: params[:times], price: params[:price], guider_id: current_guider.id)
		
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
		params.permit(:place, :image, :copy_image, :thrid_image, :fourth_image, :five_image, :title, :contents, :times)
	end

	def move_to_index
		redirect_to action: :index unless guider_signed_in?
	end
end
