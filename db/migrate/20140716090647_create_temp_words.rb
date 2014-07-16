class CreateTempWords < ActiveRecord::Migration
  def change
    create_table :temp_words do |t|
      t.string :word_str
      t.integer :num_tested
      t.integer :num_correct
      t.integer :num_correct_seq
      t.integer :num_wrong
      t.datetime :first_tested
      t.datetime :last_tested
      t.integer :user_id

      t.timestamps
    end
  end
end
