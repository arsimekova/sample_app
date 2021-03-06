class UserMailer < ActionMailer::Base
  default from: "app19083991@heroku.com"

  def welcome_email(user)
  	@user = user
  	@url = "<a href='http://localhost:3000/sign_in'>http://localhost:3000/sign_in/</a>"
  	@site_name = "Sample_App"
  	mail(:to => user.email, :subject => "Welcome to my website")
  	
  end
  def activation_instructions(user)
  	@user = user
  	@account_activation_url = activate_url(user.perishable_token)
  	mail(:to => user.email, :subject => "Account activation", :sent_on => Time.now)
  end
end
