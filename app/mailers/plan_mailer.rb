class PlanMailer < ApplicationMailer
    default from: 'chancetochance2018@gmail.com'
    layout 'mailer'

	def guider_shipment_mail(plan)
       
        @plan = plan.guider
        
       
        mail(
            from: "<chancetochance@gmail.com>",
            to:   "<#{@plan.email}>",
            subject: "お問い合わせ"
            )
    end
end
