class AddFacultyIdToPrograms < ActiveRecord::Migration[7.2]
  def change
    add_column :programs, :faculty_id, :integer
  end
end
