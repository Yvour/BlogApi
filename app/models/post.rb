class Post < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  validates :author, :presence=>true
  validates :author_id, :presence=>true
  validates :title, :presence=>true
  validates :body, :presence=>true
  validates :published_at, :presence=>true
  before_save :truncate_published_at
  
  def author_nickname
    self.author.nickname
  end
  
  
  def truncate_published_at
    self.published_at = self.published_at.change(:usec=>0)
  end
end
