class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :start
      t.string :finish
      t.string :name
      t.references :track, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
