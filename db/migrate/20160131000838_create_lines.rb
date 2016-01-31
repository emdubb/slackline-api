class CreateLines < ActiveRecord::Migration
  def change
    create_table :lines do |t|
      t.string :brand
      t.integer :length
      t.float :width
      t.string :style
      t.string :system
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
