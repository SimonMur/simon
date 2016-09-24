class CreateVisitors < ActiveRecord::Migration[5.0]
  def change
    create_table :visitors do |t|
      t.string :name
      t.string :email
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
