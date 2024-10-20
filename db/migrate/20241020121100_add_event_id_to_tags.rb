class AddEventIdToTags < ActiveRecord::Migration[7.2]
  def change
    add_column :tags, :event_id, :integer
  end
end
#с тегами была ошибка миграции, что event_id уже существует