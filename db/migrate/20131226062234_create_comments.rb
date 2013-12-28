class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :text
      t.integer :user_id
      t.integer :score
      t.integer :link_id

      t.timestamps
    end
  end
end
