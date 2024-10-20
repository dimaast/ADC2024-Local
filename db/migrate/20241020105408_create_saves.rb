class CreateSaves < ActiveRecord::Migration[7.2]
  def change
    create_table :saves do |t|
      #t.references :event, :profile, null: false, foreign_key: true
      
      t.timestamps
    end
  end
end
#проверить