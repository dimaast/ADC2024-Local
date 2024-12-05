class CreateCommentsMs < ActiveRecord::Migration[7.2]
  def change
    create_table :comments_ms do |t|
      t.text :body

      t.timestamps
    end
  end
end
