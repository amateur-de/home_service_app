# frozen_string_literal: true

class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.references :admin_user, foreign_key: true
      t.references :service, foreign_key: true
      t.datetime :time
      t.string :address
      t.string :contact

      t.timestamps
    end
  end
end
