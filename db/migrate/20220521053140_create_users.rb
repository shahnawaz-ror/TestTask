class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :fulle_name
      t.string :email
      t.datetime :date_of_bith

      t.timestamps
    end
  end
end