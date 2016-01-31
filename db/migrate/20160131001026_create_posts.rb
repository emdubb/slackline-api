class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.float :latitude
      t.float :longitude
      t.string :location
      t.string :difficulty
      t.text :message
      t.datetime :started_at
      t.datetime :finished_at
      t.references :line, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
