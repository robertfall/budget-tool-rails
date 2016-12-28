class CreateCategoryAllocations < ActiveRecord::Migration[5.0]
  def change
    create_table :category_allocations do |t|
      t.references :account, foreign_key: true, null: false
      t.references :category, foreign_key: true, null: false
      t.decimal :amount, null: false
      t.date :month, null: false
      t.index [:account_id, :category_id, :month], unique: true, name: 'category_allocations_uniq'
      t.timestamps
    end
  end
end
