class AddAuthorToEvent < ActiveRecord::Migration[7.2]
  def change
    add_column :events, :author, :string
  end
end
