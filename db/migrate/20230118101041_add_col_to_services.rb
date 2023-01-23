# frozen_string_literal: true

class AddColToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :availability, :integer, default: 0
  end
end
