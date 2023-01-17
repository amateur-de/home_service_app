# frozen_string_literal: true

class AddNameToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :name, :string
  end
end
