# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'transactions/new', type: :view do
  before(:each) do
    assign(:transaction, Transaction.new(
                           latitude: 1.5,
                           longitude: 1.5,
                           price: 1.5,
                           user: nil
                         ))
  end

  it 'renders new transaction form' do
    render

    assert_select 'form[action=?][method=?]', transactions_path, 'post' do
      assert_select 'input[name=?]', 'transaction[latitude]'

      assert_select 'input[name=?]', 'transaction[longitude]'

      assert_select 'input[name=?]', 'transaction[price]'

      assert_select 'input[name=?]', 'transaction[user_id]'
    end
  end
end
