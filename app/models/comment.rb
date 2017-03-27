class Comment < ActiveRecord::Base
  belongs_to :commenter, class_name: 'User'
  belongs_to :post
  
  validates :body, presence: true
  validates :commenter_id, presence: true
  validates :post_id, presence: true
end