class TestsController < ApplicationController

	before_action :move_to_index, except: [:index, :show]

	def index
		@tests = Test.page(params[:page]).per(20).order("created_at DESC")
	end

	def new
		
	end

	def destroy
        test = Test.find(params[:id])
        test.destroy if test.guider_id == current_guider.id
    end

    def edit
        @test = Test.find(params[:id])
    end

    def update
        test = Test.find(params[:id])
        if test.guider_id == current_guider.id
            test.update(test_params)
        end
    end

	def guideline
	end

	def show
		@test = Test.find(params[:id])
	    @tests = Test.page(params[:page]).per(3).order("created_at DESC")

	end

	def create
        Test.create(title: params[:title], body: params[:body], author: params[:author], bookname: params[:bookname], summary: params[:summary], description: params[:description], purpose: params[:purpose], secondword: params[:secondword], thirdword: params[:thirdword], image: params[:image], book: params[:book], guider_id: current_guider.id)
	end

	private
	def test_params
		params.permit(:title, :body, :description, :image, :purpose, :secondword, :thirdword, :book, :summary, :author, :bookname)
	end

    
    def move_to_index
            redirect_to action: :index unless guider_signed_in?
    end
end
