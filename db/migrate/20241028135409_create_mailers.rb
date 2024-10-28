class CreateMailers < ActiveRecord::Migration[7.2]
  def change
    create_table :mailers do |t|
      t.string :email

      t.timestamps
    end
  end
end
