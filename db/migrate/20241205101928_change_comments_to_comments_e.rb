class ChangeCommentsToCommentsE < ActiveRecord::Migration[7.2]
  def change
    rename_table :comments, :comments_e
  end
end
