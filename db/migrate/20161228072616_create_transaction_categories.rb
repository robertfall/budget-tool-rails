class CreateTransactionCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :transaction_categories do |t|
      t.references :transaction, foreign_key: true, null: false
      t.references :category_allocation, foreign_key: true, null: false
      t.decimal :amount

      t.timestamps
    end
  end
end
