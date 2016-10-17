class User < ApplicationRecord
  has_many :posts
  has_many :authors
  validates :nickname, :presence=>true
  validates :email, :presence=>true
  validates :password, :presence=>true
end
