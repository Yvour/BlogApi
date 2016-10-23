class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  validates :post, :presence=>true
  validates :author, :presence=>true
  validates :body, :presence=>true
  validates :published_at, :presence=>true
  before_save :truncate_published_at
  
  
  
  def truncate_published_at
    self.published_at = self.published_at.change(:usec=>0)
  end

end
