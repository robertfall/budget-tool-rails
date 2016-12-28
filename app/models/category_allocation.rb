class CategoryAllocation < ApplicationRecord
  belongs_to :account
  belongs_to :category
  has_many :transaction_categories
  has_many :trans, through: :transaction_categories
end
