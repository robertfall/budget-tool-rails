class AddOverdraftToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :overdraft, :decimal
  end
end
