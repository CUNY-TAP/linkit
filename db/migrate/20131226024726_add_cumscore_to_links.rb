class AddCumscoreToLinks < ActiveRecord::Migration
  def change
    add_column :links, :cumscore, :integer
  end
end
