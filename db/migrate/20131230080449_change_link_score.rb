class ChangeLinkScore < ActiveRecord::Migration
  def change
  		change_column :links, :score, :integer, :default => 0, :null => false
  end
end
