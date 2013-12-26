class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :url, presence: true


  #updates cumaltive score
  def updateScore
    #find sum of score
  	updated_score = self.comments.sum(:votes)
    #update score
    self.score = updated_score
    #save update!
    self.save
  end
end
