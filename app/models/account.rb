class Account < ApplicationRecord
  has_many :transactions
  has_many :transaction_summaries
end
