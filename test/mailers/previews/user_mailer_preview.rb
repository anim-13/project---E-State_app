class UserMailerPreview < ActionMailer::Preview
  def welcome_email
    user = User.new(name: "animesh")
    UserMailer.with(user: user).welcome_email
  end
end
