class AddProjectIdToCards < ActiveRecord::Migration[5.2]
  def change
    add_column :cards, :project_id, :integer
  end
end
