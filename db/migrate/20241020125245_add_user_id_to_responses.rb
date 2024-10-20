class AddUserIdToResponses < ActiveRecord::Migration[7.2]
  def change
    add_column :responses, :user_id, :integer
  end
end
