class AdminMailer < ApplicationMailer
	default from: 'chancetochance2018@gmail.com'
    layout 'mailer'

    def new_guider_waiting_for_approval(guider)
      @guider = guider
      mail(
      	from: '<chancetochance2018@gmail.com>',
      	to: '<#{@guider.email}>', 
      	subject: 'New User Awaiting Admin Approval'
      	)
    end
end
