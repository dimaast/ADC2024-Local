class CreateSubscribers < ActiveRecord::Migration[7.2]
  def change
    create_table :subscribers do |t|
      t.string :title
      #t.references :event, :profile, null: false, foreign_key: true

      t.timestamps
    end
  end
end
#проверить
