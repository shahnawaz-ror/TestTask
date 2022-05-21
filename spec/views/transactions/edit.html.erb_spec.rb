# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'transactions/edit', type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
                                          latitude: 1.5,
                                          longitude: 1.5,
                                          price: 1.5,
                                          user: nil
                                        ))
  end

  it 'renders the edit transaction form' do
    render

    assert_select 'form[action=?][method=?]', transaction_path(@transaction), 'post' do
      assert_select 'input[name=?]', 'transaction[latitude]'

      assert_select 'input[name=?]', 'transaction[longitude]'

      assert_select 'input[name=?]', 'transaction[price]'

      assert_select 'input[name=?]', 'transaction[user_id]'
    end
  end
end
