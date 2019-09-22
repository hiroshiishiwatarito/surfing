class KakomonController < ApplicationController
	def new
		
	end

	def index
		university = ["関西学院大学", "大阪大学"]
		@kakomons = Kakomon.where([" university LIKE ? , %#{params[:search]}%"]).page(params[:page]).per(20).order("created_at DESC")
           
	end

	def show
	end
	
end
