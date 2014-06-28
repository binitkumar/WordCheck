class CreateUserResponses < ActiveRecord::Migration
  def change
    create_table :user_responses do |t|
      t.integer :word_id
      t.integer :user_id
      t.boolean :answered_correctly

      t.timestamps
    end
  end
end
