class PlansController < ApplicationController

	before_action :move_to_index, except: [:index, :show, :category, :next, :tokyo, :kyoto, :fail, :eureka, :inquire]

	  def index

 	         @plans = Plan.where(["(times LIKE ?) OR (title LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(20).order("created_at DESC")
           @search_keyword = params[:search]
           

    end

    def top

    	  @plans = Plan.where(["(times LIKE ?) OR (title LIKE ?)", "%#{params[:search]}%", "%#{params[:search]}%"]).page(params[:page]).per(10).order("created_at DESC")
        @search_keyword = params[:search]
    end

    def category
    	
    	  @category = ["---", "新品、未使用品", "未使用品に近い" , "目立った傷や汚れなし" , "やや傷や汚れあり" ,"傷や汚れあり", "全体的に状態が悪い"]
        @category = params[:others]
    end

	  def new
	
	  end

	  def create
		    Plan.create(place: params[:place], image: params[:image], copy_image: params[:copy_image], third_image: params[:third_image], fourth_image: params[:fourth_image], five_image: params[:five_image], title: params[:title], contents: params[:contents], times: params[:times], price: params[:price], datetimes: params[:datetimes], category: [:category], others: params[:others], guider_id: current_guider.id)
		
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

    def purchase 

      @plan = Plan.find(params[:id])
      @plan.destroy

    end

    def fail
      @plan = Plan.find(params[:id])
 
    end

    def eureka
    end
    def inquire
    end

    def show
        @plan = Plan.find(params[:id])
       
        @guider = current_guider

        customer = Stripe::Customer.create({
         email: params[:stripeEmail],
         source: params[:stripeToken],
      })
    

        charge = Stripe::Charge.create({
         customer: customer.id,
         amount: @plan.price,
         description: "商品ID:#{@plan.id} 商品名:#{@plan.title}",
         currency: "jpy",

      })
      if customer.save
        #ページのリダイレクト
        redirect_to "/plans/#{@plan.id}/purchase", notice: "商品を購入しました！"
        #購入者にメールを送る
        GuiderMailer.guider_payment_mail(@guider).deliver_now
        #投稿者にメールを送る
        PlanMailer.guider_shipment_mail(@plan).deliver_now
       
      else
        redirect_to "/plans/#{@plan.id}/fail", notice: "エラーが起きました"
      end

      rescue Stripe::CardError => e
        flash[:error] = e.message

    end

	  private
	  def plan_params
		    params.permit(:datetimes, :place, :image, :copy_image, :thrid_image, :fourth_image, :five_image, :title, :contents, :times, :category, :others)
	  end

    def move_to_index
		    redirect_to action: :index unless guider_signed_in?
	  end
end
