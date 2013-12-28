class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  
  after_save :update_link
  after_destroy :update_link
  
  def vote_up
    self.increment!(:score)
  end
  
  def vote_down
    self.decrement!(:score)
  end
  
  def update_link
    self.link.update_score
  end
  
end
