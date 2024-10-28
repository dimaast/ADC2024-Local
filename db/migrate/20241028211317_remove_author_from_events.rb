class RemoveAuthorFromEvents < ActiveRecord::Migration[7.2]
  def change
    remove_column :events, :author, :string
  end
end
