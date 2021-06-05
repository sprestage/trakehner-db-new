class AddImageToHorses < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :image, :string
  end
end
