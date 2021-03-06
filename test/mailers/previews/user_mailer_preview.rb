class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.new(name: "animesh")
    UserMailer.with(user: user).welcome_email
  end

  def updation_mail
    user = User.last
    UserMailer.with(user: user).updation_mail
  end
end
