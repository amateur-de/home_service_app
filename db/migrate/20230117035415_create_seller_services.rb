# frozen_string_literal: true

class CreateSellerServices < ActiveRecord::Migration[5.2]
  def change
    create_table :seller_services do |t|
      t.references :admin_user, foreign_key: true
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
