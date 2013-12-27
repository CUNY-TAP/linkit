class AddLinkIdToComments < ActiveRecord::Migration
  def change
    add_column :comments, :link_id, :link
  end
end
