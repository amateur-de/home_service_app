# frozen_string_literal: true

class Review < ApplicationRecord
  belongs_to :service
  validates :body, presence: true, length: { maximum: 100 }
end
