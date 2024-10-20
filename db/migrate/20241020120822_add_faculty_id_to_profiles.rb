class AddFacultyIdToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :faculty_id, :integer
  end
end
