# frozen_string_literal: true

class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :level, default: 'Novice'
      t.references :admin_user, foreign_key: true

      t.timestamps
    end
  end
end
