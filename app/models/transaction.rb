class Transaction < ApplicationRecord
  belongs_to :account

  attr_accessor :expense
end
