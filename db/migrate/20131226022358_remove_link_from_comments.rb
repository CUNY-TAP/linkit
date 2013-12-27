class RemoveLinkFromComments < ActiveRecord::Migration
  def change
    remove_column :comments, :link, :integer
  end
end
