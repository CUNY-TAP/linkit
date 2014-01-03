class Comment < ActiveRecord::Base
  belongs_to :link
  belongs_to :user

   validates_presence_of :name
   validates_length_of :name, :within => 2..20
   validates_presence_of :body
   
  after_save :update_link
  after_destroy :update_link

  
end
