class CreatePosts < ActiveRecord::Migration
  def self.up
   create_table :posts do |t|
     t.column  :id,		:int
     t.column  :title,		:string
     t.column  :body,		:text
     t.column  :created_at,	:datetime
   end
end 

def self.down
	drop_table :posts

  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
