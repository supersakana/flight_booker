class PassengerMailer < ApplicationMailer
  def welcome_email
    @passenger = params[:passenger]
    # @url = 'http://example.com/login'
    mail(to: @passenger.email, subject: 'Your flight is booked!')
  end
end
