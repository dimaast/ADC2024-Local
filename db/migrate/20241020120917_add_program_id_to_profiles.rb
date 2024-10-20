class AddProgramIdToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :program_id, :integer
  end
end
