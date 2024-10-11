class AddCommunityRefToEvents < ActiveRecord::Migration[7.2]
  def change
    add_reference :events, :community, null: true, foreign_key: true
  end
end
