class Comment < ActiveRecord::Base
	belongs_to :link
	after_save :updateParent, only: [:voteUp,:voteDown]

	def voteUp
		self.score += 1
		self.save
	end

	def voteDown
		self.score -= 1
		self.save
	end

	def updateParent
		if self.link.present?
			self.link.updateScore
		end
	end

end
