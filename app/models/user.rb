class User < ApplicationRecord
  # Include default devise modules.
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable,
          :confirmable, :omniauthable
  include DeviseTokenAuth::Concerns::User
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  validates :nickname, :presence=>true
  validates :email, :presence=>true
  validates :password, :presence=>true
end
