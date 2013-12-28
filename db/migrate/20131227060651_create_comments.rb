class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :score
      t.belongs_to :link, index: true

      t.timestamps
    end
  end
end
