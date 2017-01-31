class CreateProductReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :product_reviews do |t|
      t.integer :product_id
      t.string :title
      t.text :description

      t.timestamps
    end
    add_index :product_reviews, :product_id
  end
end
