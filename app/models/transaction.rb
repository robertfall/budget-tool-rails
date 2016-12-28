class Transaction < ApplicationRecord
  belongs_to :account

  attr_reader :expense

  def expense=(value)
    @expense = ActiveRecord::Type::Boolean.new.deserialize(value)
  end
end
