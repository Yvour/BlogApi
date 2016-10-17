class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  validates :nickname, :presence=>true
  validates :email, :presence=>true
  validates :password, :presence=>true
end
