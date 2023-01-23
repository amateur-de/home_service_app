# frozen_string_literal: true

class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.string :reviewer
      t.text :body
      t.references :service, foreign_key: true

      t.timestamps
    end
  end
end
