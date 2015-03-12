class CreateComment < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :body
      t.belongs_to :tournament, index: true
      t.belongs_to :user, index: true
      t.timestamps
    end
    add_foreign_key :comments, :tournaments
    add_foreign_key :comments, :users
  end
end
