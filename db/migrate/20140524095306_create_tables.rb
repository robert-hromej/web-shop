class CreateTables < ActiveRecord::Migration
  def change
    # CUSTOMERS
    create_table :customers do |t|
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
    add_index :customers, :email

    # CATEGORIES
    create_table :categories do |t|
      t.integer :parent_id
      t.string :title, null: false
      t.integer :product_option_mask
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :categories, :title
    add_index :categories, :parent_id

    # Products
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :descriptions
      t.float :price
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :title, unique: true
    add_index :products, :price

    # ProductOptions
    create_table :product_options do |t|
      t.string :title, null: false

      t.timestamps
    end
    add_index :product_options, :title

    # ProductParams
    create_table :product_params do |t|
      t.string :title
      t.integer :product_option_id

      t.timestamps
    end
    add_index :product_params, :title

  end
end
