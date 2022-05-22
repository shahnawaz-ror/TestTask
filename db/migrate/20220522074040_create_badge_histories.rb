# frozen_string_literal: true

class CreateBadgeHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :badge_histories do |t|
      t.references :badge, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :status, default: true
      t.timestamps
    end
  end
end
