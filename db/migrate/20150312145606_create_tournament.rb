class CreateTournament < ActiveRecord::Migration
  def change
    create_table :tournaments do |t|
      t.belongs_to :user, index: true
      t.string :question
      t.string :email_list
      t.timestamps
    end
    add_foreign_key :tournaments, :users
  end
end
