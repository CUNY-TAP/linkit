class Comment < ActiveRecord::Base
	belongs_to :user
	belongs_to :link

	after_save :update_link_score
	after_destroy :update_link_score

	validates :user_id, presence: true
	validates :link_id, presence: true

	def update_link_score
		cumulative_score = self.link.comments.sum(:score)
		self.link.update_attribute(:score, cumulative_score)
	end
end
