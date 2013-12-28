class AddScoreToLinks < ActiveRecord::Migration
  def change
  	add_column :links, :score, :integer
  end
end
