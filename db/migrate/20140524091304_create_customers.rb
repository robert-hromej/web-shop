class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :email, null: false
      t.string :password, null: false

      t.timestamps
    end
  end
end
