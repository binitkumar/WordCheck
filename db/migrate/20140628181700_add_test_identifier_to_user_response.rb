class AddTestIdentifierToUserResponse < ActiveRecord::Migration
  def change
    add_column :user_responses, :test_identifier, :string
  end
end
