class AddParentsToHorses < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :dam_id, :integer
    add_column :horses, :sire_id, :integer
  end
end
