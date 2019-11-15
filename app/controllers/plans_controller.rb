class PlansController < ApplicationController

	before_action :move_to_index, except: [:index, :show, :category, :top, :next, :tokyo, :kyoto, :fail, :eureka, :inquire]

	  def index

 	      @plans = Plan.where(["(times LIKE ?) OR (title LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(20).order("created_at DESC")
        @search_keyword = params[:search]
        render layout: false
        
    end

    def top

    	  @plans = Plan.where(["(times LIKE ?) OR (title LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(10).order("created_at DESC")
        @search_keyword = params[:search]
        @tests = Test.page(params[:page]).per(20).order("created_at DESC")
        render layout: false
        
    end

    def category
    	
    	  @category = ["---", "新品、未使用品", "未使用品に近い" , "目立った傷や汚れなし" , "やや傷や汚れあり" ,"傷や汚れあり", "全体的に状態が悪い"]
        @category = params[:others]
        render layout: false
    end

	  def new
	      render layout: false
	  end

	  def create
		    Plan.create(place: params[:place], image: params[:image], copy_image: params[:copy_image], third_image: params[:third_image], fourth_image: params[:fourth_image], five_image: params[:five_image], title: params[:title], contents: params[:contents], times: params[:times], price: params[:price], datetimes: params[:datetimes], category: [:category], others: params[:others], guider_id: current_guider.id)
		    render layout: false
  	end

	  def destroy
		    plan = Plan.find(params[:id])
	    	plan.destroy if plan.guider_id == current_guider.id
        render layout: false
	  end

	  def edit
		    @plan = Plan.find(params[:id])
        render layout: false
	  end

	  def update
        plan = Plan.find(params[:id])
        if plan.guider_id == current_guider.id
        	plan.update(plan_params)
        end
        render layout: false
    end

    def purchase 

      @plan = Plan.find(params[:id])
      @plan.destroy
      render layout: false

    end

    def fail
      @plan = Plan.find(params[:id])
      render layout: false
    end

    def eureka
      render layout: false
    end

    def tos
      render layout: false
    end
    def compliance
      render layout: false
    end
    def tokutei
      render layout: false
    end

    def inquire
    end

    def show
      
      @plan = Plan.find(params[:id])

      render layout: false

    end

	  private
	  def plan_params
		    params.permit(:datetimes, :place, :image, :copy_image, :thrid_image, :fourth_image, :five_image, :title, :contents, :times, :category, :others)
	  end

    def move_to_index
		    redirect_to action: :index unless guider_signed_in?
	  end
end
