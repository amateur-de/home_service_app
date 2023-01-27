# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :service
  validates :body, presence: true, length: { maximum: 100 }
end
