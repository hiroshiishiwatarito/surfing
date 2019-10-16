class InquiryMailer < ApplicationMailer
  default from: "chancetochance2018@gmail.com"   # 送信元アドレス
  layout 'mailer'    
 
  def received_email(inquiry)
    @inquiry = inquiry
    mail(
    	from: 'chancetochance2018@gmail.com', # 送信元アドレス
          to: 'chancetochance2018@gmail.com',
    	subject: 'お問い合わせを承りました'
    	)
  end
end
