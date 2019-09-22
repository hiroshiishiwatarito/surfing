class TestsController < ApplicationController

	def index
		@tests = Test.page(params[:page]).per(20).order("created_at DESC")
	end

	def new
		
	end

	def create
        Test.create(title: params[:title], body: params[:body], description: params[:description], image: params[:image])
	end

	private
	def test_params
		params.permit(:title, :body, :description, :image)
	end
end
