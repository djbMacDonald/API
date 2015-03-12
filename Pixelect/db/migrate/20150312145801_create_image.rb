class CreateImage < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.belongs_to :tournament, index: true
      t.string :url
      t.integer :wins
      t.integer :flags
      t.timestamps
    end
    add_foreign_key :images, :tournaments
  end
end
