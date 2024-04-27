class Account < ApplicationRecord
  validates :hostname, presence: true
  validates :account_name, presence: true

  has_many :links
end
