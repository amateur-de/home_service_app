# frozen_string_literal: true

class AddColumnToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :start, :datetime
  end
end
