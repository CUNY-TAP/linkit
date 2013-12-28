class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :url, presence: true
  
  def update_score
    updated_score = self.comments.sum(:score)
    self.update_attribute(:score,updated_score)
  end
  
end
