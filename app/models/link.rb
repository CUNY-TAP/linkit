class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  after_create :init
  validates :url, presence: true

  def score_changed     
    update_cumulative_score
  end

  def update_cumulative_score
  	if self.score.nil?
  		self.score = 0
  		self.save
  	end
    self.score = self.comments.sum(:score)
    self.save
 end

 def init
    if self.score.nil?
      self.score = 0 
      self.save
    end
  end
end
