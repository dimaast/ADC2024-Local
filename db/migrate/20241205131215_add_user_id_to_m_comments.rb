class AddUserIdToMComments < ActiveRecord::Migration[7.2]
  def change
    add_reference :m_comments, :user, null: false, foreign_key: true
  end
end
