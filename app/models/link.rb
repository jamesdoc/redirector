require 'uri'

class Link < ApplicationRecord
  REDIRECT_TYPES = %w[301 302 307 308]
  validates :url, presence: true
  validates :token, presence: true, uniqueness: {scope: :account_id}
  validates :redirect_type, presence: true, inclusion: REDIRECT_TYPES

  belongs_to :account

  def origin_url
    "https://#{self.account.hostname}/#{self.token}"
  end

  def presentable_destination_url
    u = URI.parse(self.url)
    "#{u.host}#{u.path}"
  end

  def presentable_origin_url
    "#{self.account.hostname}/#{self.token}"
  end

  default_scope { joins(:account) }

  scope :on_account, -> (account_id) { joins(:account).where("account_id = ?", account_id) }
  scope :on_host, -> (host_name) { joins(:account).where("hostname = ?", host_name) }
end
