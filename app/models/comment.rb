class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :post
  validates :user, presence: true
  validates :post, presence: true

  after_create :send_email

  def send_email
    Resque.enqueue(CommentEmail, id)
  end
end
