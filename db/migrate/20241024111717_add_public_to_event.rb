class AddPublicToEvent < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :public, :boolean, default: false
  end
end
