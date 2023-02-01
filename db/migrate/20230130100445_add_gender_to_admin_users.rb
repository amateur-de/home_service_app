# frozen_string_literal: true

class AddGenderToAdminUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :admin_users, :gender, :string, default: 'Male'
  end
end
