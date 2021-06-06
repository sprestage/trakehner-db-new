class CreateBreeders < ActiveRecord::Migration[5.2]
  def change
    create_table :breeders do |t|
      t.string :name
      t.string :address

      t.timestamps      
    end
  end
end
