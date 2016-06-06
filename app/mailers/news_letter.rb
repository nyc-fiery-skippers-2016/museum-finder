class NewsLetter < ApplicationMailer
  default from: 'notifications@example.com'

  def monthly_email
    # @user = user
    @url  = 'http://museumfinderdbc@gmail.com'
    mail(to: "bpd4tw@virginia.edu", subject: 'Welcome to My Awesome Site')
  end
end
