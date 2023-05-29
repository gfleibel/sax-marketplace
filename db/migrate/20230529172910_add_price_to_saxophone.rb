class AddPriceToSaxophone < ActiveRecord::Migration[7.0]
  def change
    add_column :saxophones, :price, :float
  end
end
