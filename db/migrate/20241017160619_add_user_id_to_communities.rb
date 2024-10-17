class AddUserIdToCommunities < ActiveRecord::Migration[7.2]
  def change
    add_column :communities, :user_id, :integer
  end
end
