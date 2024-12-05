class ChangeCommentsMsToMComments < ActiveRecord::Migration[7.2]
  def change
    rename_table :comments_ms, :m_comments
  end
end
