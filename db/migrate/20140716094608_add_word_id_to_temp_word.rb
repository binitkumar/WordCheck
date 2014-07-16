class AddWordIdToTempWord < ActiveRecord::Migration
  def change
    add_column :temp_words, :word_id, :integer
  end
end
