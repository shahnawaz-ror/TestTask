# frozen_string_literal: true

class CreatePointHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :point_histories do |t|
      t.integer :earned
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
