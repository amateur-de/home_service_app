# frozen_string_literal: true

class Drop < ActiveRecord::Migration[5.2]
  def change
    drop_table :articles
  end
end
