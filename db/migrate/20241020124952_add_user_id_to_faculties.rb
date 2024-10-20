class AddUserIdToFaculties < ActiveRecord::Migration[7.2]
  def change
    add_column :faculties, :user_id, :integer
  end
end
