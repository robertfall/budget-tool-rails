class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.string :description
      t.date :processed_on
      t.references :account, foreign_key: true
      t.decimal :amount
      t.timestamps
    end
  end
end
