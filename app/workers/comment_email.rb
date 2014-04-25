class CommentEmail
  @queue = :email

  def self.perform(cid)
    comment = Comment.find(cid)
    mail_data = { author: comment.post.user.fname,
                  author_email: comment.post.user.email,
                  post: comment.post.title,
                  commenter: "#{comment.user.fname} #{comment.user.lname}",
                  commenter_email: comment.user.email,
                  comment_title: comment.title,
                  comment_content: comment.content }
    CommentMailer.comment_made(mail_data).deliver
  end
end
