class Patient < ApplicationRecord
  has_many :payments
  attr_accessor :total_amount
end
