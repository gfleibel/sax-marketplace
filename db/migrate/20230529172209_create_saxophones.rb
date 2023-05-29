class CreateSaxophones < ActiveRecord::Migration[7.0]
  def change
    create_table :saxophones do |t|
      t.string :title
      t.string :manufacturer
      t.string :category
      t.string :sax_model
      t.string :condition
      t.string :serial_number
      t.text :details
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
