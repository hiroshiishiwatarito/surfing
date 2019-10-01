class TestsController < ApplicationController

	def index
		@tests = Test.page(params[:page]).per(20).order("created_at DESC")
	end

	def new
		
	end

	def show
		@test = Test.find(params[:id])
	    @tests = Test.page(params[:page]).per(3).order("created_at DESC")

	end

	def create
        Test.create(title: params[:title], body: params[:body], summary: params[:summary], description: params[:description], purpose: params[:purpose], secondword: params[:secondword], thirdword: params[:thirdword], image: params[:image], book: params[:book])
	end

	private
	def test_params
		params.permit(:title, :body, :description, :image, :purpose, :secondword, :thirdword, :book, :summary)
	end
end
