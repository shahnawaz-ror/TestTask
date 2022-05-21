class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.datetime :initiate_date
      t.float :latitude
      t.float :longitude
      t.float :price
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
