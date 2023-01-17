# frozen_string_literal: true

class SellerService < ApplicationRecord
  belongs_to :admin_user
  belongs_to :service
end
