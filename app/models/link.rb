class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
end 
  def updateScore
  	updated_score = self.comments.sum(:votes)
  	self.score = updated_score
  	self.save
  	has_many :comments
end 
