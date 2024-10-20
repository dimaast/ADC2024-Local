class CreateProfiles < ActiveRecord::Migration[7.2]
  def change
    create_table :profiles do |t|
      t.string :title
      t.string :body
      t.string :contact
      t.string :avatar

      #t.references :event, :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
#проверить