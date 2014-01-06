class Comment < ActiveRecord::Base
  belongs_to :link

  after_update :update_Parent
  after_save :update_Parent # could add  if: lambda{self.score_changed?}
  #lambda creates a black box that the program doesn't need to worry about until it runs. 
  #the score_changed method works on an object that's sitting in memory which may not exist just yet

  def vote_up
  	cumulative_score = self.score += 1
 	  #self.save 	
    self.update_attribute(:score,cumulative_score);
  end

  def update_Parent #notify_link is a nother name
  	if self.link != nil
  		#self.link.update_Score
      self.link.score_changed # if link.present?
  	end
  end

  #alternatively we could get rid of after_save and just call update_Parent from vote_up 
  #and don't need to check if link present in update_Parent because it's only being 
  #called when there is a link!
end
