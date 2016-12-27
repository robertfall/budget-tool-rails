class CreateTransactionSummaries < ActiveRecord::Migration
  def change
    create_view :transaction_summaries
  end
end
