class TestsController < ApplicationController

	before_action :move_to_index, except: [:index, :show]

	def index
		@tests = Test.page(params[:page]).per(20).order("created_at DESC")
		render layout: false
	end

	def new
		@category = ["ビジネス", "文学" , "医学" , "IT"]
		@small_category = ["ビジネス", "文学" , "医学" , "IT"]
		render layout: false
	end

	def destroy
        test = Test.find(params[:id])
        test.destroy if test.guider_id == current_guider.id
        render layout: false
    end

    def edit
        @test = Test.find(params[:id])
        render layout: false
    end

    def update
        test = Test.find(params[:id])
        if test.guider_id == current_guider.id
            test.update(test_params)
        end
        render layout: false
    end

	def guideline
		render layout: false
	end

	def show
		@test = Test.find(params[:id])
	    @tests = Test.page(params[:page]).per(2).order("created_at DESC")
	    render layout: false

	end

	def create
        Test.create(title: params[:title], category: params[:category], small_category: params[:small_category], body: params[:body], author: params[:author], bookname: params[:bookname], summary: params[:summary], description: params[:description], purpose: params[:purpose], secondword: params[:secondword], thirdword: params[:thirdword], image: params[:image], book: params[:book], advertise: params[:advertise], people: params[:people], material: params[:material], detail: params[:detail], fourthword: params[:fourthword], fiveword: params[:fiveword], guider_id: current_guider.id)
        render layout: false
	end

	private
	def test_params
		params.permit(:title, :body, :description, :image, :purpose, :secondword, :thirdword, :book, :summary, :author, :bookname)
	end

    
    def move_to_index
        redirect_to action: :index unless guider_signed_in?
    end
end
