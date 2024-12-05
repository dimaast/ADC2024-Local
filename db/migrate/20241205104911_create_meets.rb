class CreateMeets < ActiveRecord::Migration[7.2]
  def change
    create_table :meets do |t|
      t.text :body
      t.datetime :date_hosted
      t.string :geotag
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
