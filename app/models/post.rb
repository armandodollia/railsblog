class Post < ActiveRecord::Base
  has_many :comments
  belongs_to :poster, class_name: 'User'
  
  validates :title, presence: true
  validates :body, presence: true
  validates :poster_id, presence: true
end