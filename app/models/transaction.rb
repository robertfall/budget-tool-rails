class Transaction < ApplicationRecord
  belongs_to :account
  has_many :transaction_categories
  has_many :categories, through: :transaction_categories

  attr_reader :expense

  def expense=(value)
    @expense = ActiveRecord::Type::Boolean.new.deserialize(value)
  end
end
