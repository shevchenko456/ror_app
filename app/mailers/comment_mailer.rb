class CommentMailer < ActionMailer::Base
  default from: 'RoR App <app@r.or>'
  layout false

  def comment_made(mail_data)
    @mail_data = mail_data
    mail(to: @mail_data[:author_email], subject: "New comment to your post «#{@mail_data[:post]}»")
  end
end