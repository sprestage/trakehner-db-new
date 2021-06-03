class AddBreederIdToHorses < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :breeder_id, :integer
  end
end
