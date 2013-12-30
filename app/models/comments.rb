class Comments < ActiveRecord::Base
	belongs_to :link
	validates :comment, presence: true
end
