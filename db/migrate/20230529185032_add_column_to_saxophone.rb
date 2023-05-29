class AddColumnToSaxophone < ActiveRecord::Migration[7.0]
  def change
    add_column :saxophones, :status, :boolean
  end
end
