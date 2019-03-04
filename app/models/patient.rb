class Patient < ApplicationRecord
  has_many :payments
end
