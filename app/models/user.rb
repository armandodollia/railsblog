class User < ActiveRecord::Base
  has_many :posts, foreign_key: :poster_id
  has_many :comments, foreign_key: :commenter_id

  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # memoization, left side is returned if true
  #if not true right side is evaluated and set equal to left side
  
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end

  def self.authenticate(params)
    user = User.find_by(email: params[:user_cred]) || User.find_by(username: params[:user_cred])
    return user if user && user.password == params[:password]
  end
end