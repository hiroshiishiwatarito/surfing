class ProfessionsController < ApplicationController

    before_action :move_to_index, except: [:category, :index, :top, :show]

    def category
    end
    
	def index
		
	    @professions = Profession.group(:lesson).where(["(university LIKE ?) AND (faculty LIKE ?) AND (season LIKE ?)" , "%#{params[:university]}%", "%#{params[:faculty]}%", "%#{params[:season]}%"]).page(params[:page]).per(20).order("created_at DESC")
        @professions = Profession.group(:lesson).where(["(university LIKE ?) AND (faculty LIKE ?) AND (season LIKE ?) AND (detail LIKE?)" , "%#{params[:university]}%", "%#{params[:faculty]}%", "%#{params[:season]}%",  "%#{params[:detail]}%"]).page(params[:page]).per(20).order("created_at DESC")

	    @search_keyword1 = params[:university]
	    @search_keyword2 = params[:faculty]

	end

	def top
		@profession = Profession.find(params[:id])
		@professions = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).page(params[:page]).per(20 ).order("created_at DESC")

	    @search_keyword1 = params[:search1]
	    @search_keyword2 = params[:search2]
        #合計値
        @chart15 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).count
        #個々の合計
        @chart1 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:star => "1").count
        @chart100 = (@chart1 * 100 / @chart15) 
        @chart2 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:star => "2").count
        @chart101 = (@chart2 * 100 / @chart15) 
        @chart3 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:star => "3").count
        @chart102 = (@chart3 * 100 / @chart15) 
        @chart4 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:star => "4").count
        @chart103 = (@chart4 * 100 / @chart15)
        @chart5 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:star => "5").count
        @chart104 = (@chart5 * 100 / @chart15) 
        #%を付ける方法
        @chart110 = @chart103.to_s + "%<minute>" % { minute: 1 }
        #グラフにする方法
	    @chart = [['大変不満足',  @chart100], ['不満足',  @chart101], ["まあまあ",  @chart102], ["満足",  @chart103], ["すごい満足",  @chart104]]

        #funのデータ
	   #合計値
        @chart16 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).count
        #個々の合計
        @chart6 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:fun => "1").count
        @chart105 = (@chart6 * 100 / @chart16) 
        @chart7 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:fun => "2").count
        @chart106 = (@chart7 * 100 / @chart16) 
        @chart8 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:fun => "3").count
        @chart107 = (@chart8 * 100 / @chart16) 
        @chart9 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:fun => "4").count
        @chart108 = (@chart9 * 100 / @chart16)
        @chart10 = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).where(:fun => "5").count
        @chart109 = (@chart10 * 100 / @chart16) 
	    @chart11 = [['大変不満足', @chart105], ["不満足",  @chart106], ["まあまあ",  @chart107], ["満足",  @chart108], ["すごい満足",  @chart109]]

	end

	def new
	end

    def destroy
        profession = Profession.find(params[:id])
        profession.destroy if profession.guider_id == current_guider.id
    end

    def edit
        @profession = Profession.find(params[:id])
    end

    def update
        profession = Profession.find(params[:id])
        if profession.guider_id == current_guider.id
            profession.update(profession_params)
        end
    end

	def show 
		@profession = Profession.find(params[:id])
	    @professions = Profession.where(faculty: @profession.faculty, lesson: @profession.lesson).page(params[:page]).per(20).order("created_at DESC")
        #近い値と遠い値
	    @professions.each {|profession|
           profession.pick_up = (profession.star - 1) * (profession.star - 1) + (profession.fun - 5) * (profession.fun - 5)
           profession.save   
	   }
	   ##最低と最高のデータを取る方法
       
        @high = Profession.where(lesson: @profession.lesson, pick_up: @professions.maximum(:pick_up))
        @low = Profession.where(lesson: @profession.lesson, pick_up: @professions.minimum(:pick_up))
      
	end

	def create
		Profession.create(university: params[:university], faculty: params[:faculty], teacher: params[:teacher], lesson: params[:lesson], book: params[:book], test: params[:test], thing: params[:thing], content: params[:content], year: params[:year], confirm: params[:confirm], recommendation: params[:recommendation], feel: params[:feel], star: params[:star], rate: params[:rate] , fun: params[:fun], season: params[:season], detail: params[:detail], guider_id: current_guider.id)
	end

	private
	def profession_params
		params.permit(:university, :faculty, :teacher, :lesson, :book, :test, :thing, :content, :year, :confirm, :recommendation, :feel, :rate, :star, :fun, :season, :detail)
	end

    def move_to_index
            redirect_to action: :index unless guider_signed_in?
    end

end
