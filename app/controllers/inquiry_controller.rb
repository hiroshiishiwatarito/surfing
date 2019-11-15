class InquiryController < ApplicationController
	def index
    # 入力画面を表示
    @inquiry = Inquiry.new
    
    render layout: false
  end
 
  def confirm
    # 入力値のチェック
    @inquiry = Inquiry.new(params[:inquiry])
    if @inquiry.valid?
      # OK。確認画面を表示
      render layout: false
    else
      # NG。入力画面を再表示
      render layout: false
    end
    
  end
 
  def thanks
    # メール送信
    @inquiry = Inquiry.new(params[:inquiry])
    InquiryMailer.received_email(@inquiry).deliver_now
 
    # 完了画面を表示
    render layout: false
  end
end
