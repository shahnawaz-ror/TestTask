# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'transactions/show', type: :view do
  before(:each) do
    @transaction = assign(:transaction, Transaction.create!(
                                          latitude: 2.5,
                                          longitude: 3.5,
                                          price: 4.5,
                                          user: nil
                                        ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/2.5/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4.5/)
    expect(rendered).to match(//)
  end
end
