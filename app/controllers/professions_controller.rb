class ProfessionsController < ApplicationController

    def category
    end
    
	def index
	    @professions = Profession.where(["(university LIKE ?) AND (faculty LIKE ?)", "%#{params[:search1]}%", "%#{params[:search2]}%"]).page(params[:page]).per(20 ).order("created_at DESC")
	    @search_keyword1 = params[:search1]
	    @search_keyword2 = params[:search2]
	end

	def new
	end

	def show 
		@profession = Profession.find(params[:id])
	end

	def create
		Profession.create(university: params[:university], faculty: params[:faculty], teacher: params[:teacher], lesson: params[:lesson], book: params[:book], test: params[:test], thing: params[:thing], content: params[:content], year: params[:year], confirm: params[:confirm], recommendation: params[:recommendation], feel: params[:feel], star: params[:star], rate: params[:rate] , guider_id: current_guider.id)
		
	end

	private
	def profession_params
		params.permit(:university, :faculty, :teacher, :lesson, :book, :test, :thing, :content, :year, :confirm, :recommendation, :feel, :rate, :star)
	end

end
