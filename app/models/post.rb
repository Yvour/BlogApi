class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  validates :author, :presence=>true
  validates :title, :presence=>true
  validates :body, :presence=>true
  validates :published_at, :presence=>true
  
  def author_nickname
    self.author.nickname
  end
end