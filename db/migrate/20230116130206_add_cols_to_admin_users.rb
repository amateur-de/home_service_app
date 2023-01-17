# frozen_string_literal: true

class AddColsToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :name, :string
    add_column :admin_users, :age, :integer
  end
end
