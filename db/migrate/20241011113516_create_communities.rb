class CreateCommunities < ActiveRecord::Migration[7.2]
  def change
    create_table :communities do |t|
      t.string :title
      t.string :link
      t.text :body

      t.timestamps
    end
  end
end
