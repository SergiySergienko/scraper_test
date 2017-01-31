class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :source_url
      t.string :name
      t.float :price

      t.timestamps
    end
  end
end
