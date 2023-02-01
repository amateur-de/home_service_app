# frozen_string_literal: true

class Drop < ActiveRecord::Migration[5.2]
  def change
    drop_table :articles do |t|
      t.string title
      t.text text
    end
  end
end
