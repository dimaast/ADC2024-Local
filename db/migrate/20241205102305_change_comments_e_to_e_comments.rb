class ChangeCommentsEToEComments < ActiveRecord::Migration[7.2]
  def change
    rename_table :comments_e, :e_comments
  end
end
