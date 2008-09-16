class UserMailer < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'activate your account.'
  
    @body[:url]  = "http://splurgel.com/activate/#{user.activation_code}"
  
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'We are ready for you! Are you ready?'
    @body[:url]  = "http://splurgel.com"
  end
  
  protected
    def setup_email(user)
      @recipients  = "#{user.email}"
      @from        = "mike.splurgel@gmail.com"
      @subject     = "Splurgel- "
      @sent_on     = Time.now
      @body[:user] = user
    end
end
