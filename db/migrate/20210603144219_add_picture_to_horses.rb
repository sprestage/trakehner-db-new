class AddPictureToHorses < ActiveRecord::Migration[5.2]
  def change
    add_column :horses, :picture, :string
  end
end
