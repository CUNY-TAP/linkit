class ChangeCommentScore < ActiveRecord::Migration
  def change
  	change_column :comments, :score, :integer, :default => 0, :null => false
  end
end
