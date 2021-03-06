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
      t.boolean :active, null: false, default: false
      t.boolean :retail, null: false, default: false
      t.boolean :wholesale, null: false, default: false

      t.timestamps
    end
    add_index :categories, :title
    add_index :categories, :parent_id

    # Products
    create_table :products do |t|
      t.integer :category_id, null: false
      t.string :title, null: false
      t.text :description
      t.float :price
      t.boolean :active, default: false

      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :title, unique: true
    add_index :products, :price

    # CategoryColors
    create_table :category_colors do |t|
      t.integer :color_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
    add_index :category_colors, [:color_id, :category_id]

    # Colors
    create_table :colors do |t|
      t.string :title, null: false

      t.timestamps
    end
    add_index :colors, :title

    # CategorySizes
    create_table :category_sizes do |t|
      t.integer :size_id, null: false
      t.integer :category_id, null: false

      t.timestamps
    end
    add_index :category_sizes, [:size_id, :category_id]

    # Sizes
    create_table :sizes do |t|
      t.string :title

      t.timestamps
    end
    add_index :sizes, :title

    # Items
    create_table :product_items do |t|
      t.integer :product_id, null: false
      t.integer :size_id, null: false
      t.integer :color_id, null: false
      t.integer :amount

      t.timestamps
    end
    add_index :product_items, :product_id
    add_index :product_items, :size_id
    add_index :product_items, :color_id
    add_index :product_items, [:product_id, :size_id, :color_id], unique: true

    # Cards
    create_table :cards do |t|
      t.integer :customer_id, null: false
      t.float :cost
      t.boolean :paid, default: false

      t.timestamps
    end

    # CardItems
    create_table :card_items do |t|
      t.integer :card_id, null: false
      t.integer :customer_id, null: false
      t.integer :product_id, null: false
      t.integer :size_id, null: false
      t.integer :color_id, null: false
      t.integer :amount
      t.float :cost
      t.float :sold_price
      t.boolean :paid, default: false
      t.timestamp :sold_at
      t.text :data

      t.timestamps
    end

  end
end
