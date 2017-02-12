class DeliveryNotificationMailer < ApplicationMailer
  default from: 'keenan@tabletopapp.com'
  layout 'mailer'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.delivery_notification_mailer.welcome.subject
  #
  def welcome(person)
    @greeting = "Hi"
    @person = person
    mail(to: "keenantparker@gmail.com", subject:'Example')
  end
end
