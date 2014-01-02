class Link < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  validates :url, presence: true
  acts_as_voteable
end
