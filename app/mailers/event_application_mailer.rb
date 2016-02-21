class EventApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def notify_entry(envet_application)
    @envet_application = envet_application

    mail(
      from: '運営 <example@example.com>',
      to: @envet_application.email,
      subject: "#{@envet_application.name}さん ありがとうございます"
    )
  end
end
