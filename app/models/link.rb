class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :url, presence: true

  def score_changed
    update_cumulative_score
  end

  def update_cumulative_score
    cumulative_score = self.comments.sum(:score)
    self.update_attribute(:score, cumulative_score)
  end
end
