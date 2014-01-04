class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user
  after_create :init
  after_save :notify_link, only: [:vote_up, :vote_down]

  def vote_up
    self.score += 1
    self.save
  end

  def vote_down
    self.score -= 1
    self.save
  end

  def notify_link
    link.score_changed if link.present? 
  end

  def init
    if self.score.nil?
      self.score = 0 
      self.save
    end
  end
end
