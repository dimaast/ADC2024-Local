class AddCommunityIdToSubscribers < ActiveRecord::Migration[7.2]
  def change
    add_column :subscribers, :community_id, :integer
  end
end
