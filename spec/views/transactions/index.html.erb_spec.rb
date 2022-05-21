# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'transactions/index', type: :view do
  before(:each) do
    assign(:transactions, [
             Transaction.create!(
               latitude: 2.5,
               longitude: 3.5,
               price: 4.5,
               user: nil
             ),
             Transaction.create!(
               latitude: 2.5,
               longitude: 3.5,
               price: 4.5,
               user: nil
             )
           ])
  end

  it 'renders a list of transactions' do
    render
    assert_select 'tr>td', text: 2.5.to_s, count: 2
    assert_select 'tr>td', text: 3.5.to_s, count: 2
    assert_select 'tr>td', text: 4.5.to_s, count: 2
    assert_select 'tr>td', text: nil.to_s, count: 2
  end
end
