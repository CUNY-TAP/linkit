class Link < ActiveRecord::Base
  belongs_to :user
  validates :url, presence: true
  has_many :comments, dependent: :destroy

  def my_score
  @totalscore = 0
  self.comments.each do |comment|
    @totalscore += comment.score
  end
  self.score = @totalscore
  self.save
end
end
