# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20_220_522_074_040) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'badge_histories', force: :cascade do |t|
    t.bigint 'badge_id', null: false
    t.bigint 'user_id', null: false
    t.boolean 'status', default: true
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['badge_id'], name: 'index_badge_histories_on_badge_id'
    t.index ['user_id'], name: 'index_badge_histories_on_user_id'
  end

  create_table 'badges', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'point_histories', force: :cascade do |t|
    t.integer 'earned'
    t.string 'location'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_point_histories_on_user_id'
  end

  create_table 'rewards', force: :cascade do |t|
    t.string 'title'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
  end

  create_table 'transactions', force: :cascade do |t|
    t.datetime 'initiate_date'
    t.float 'latitude'
    t.float 'longitude'
    t.float 'price'
    t.bigint 'user_id', null: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['user_id'], name: 'index_transactions_on_user_id'
  end

  create_table 'user_rewards', force: :cascade do |t|
    t.bigint 'user_id', null: false
    t.bigint 'reward_id', null: false
    t.boolean 'status', default: false
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.index ['reward_id'], name: 'index_user_rewards_on_reward_id'
    t.index ['user_id'], name: 'index_user_rewards_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'fulle_name'
    t.datetime 'date_of_bith'
    t.datetime 'created_at', precision: 6, null: false
    t.datetime 'updated_at', precision: 6, null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end

  add_foreign_key 'badge_histories', 'badges'
  add_foreign_key 'badge_histories', 'users'
  add_foreign_key 'point_histories', 'users'
  add_foreign_key 'transactions', 'users'
  add_foreign_key 'user_rewards', 'rewards'
  add_foreign_key 'user_rewards', 'users'
end
