class UserMailer < ActionMailer::Base
  require 'json'
require 'hashie'
  
default from: "Mjweller"
def user_mailer(user)
  hash = JSON.parse user.to_json
@obj = Hashie::Mash.new hash
   
   
    mail( :to =>"deepaktherizing@gmail.com" ,
    :subject => @obj.subject )
  end
end
