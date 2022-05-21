# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
             User.create!(
               fulle_name: 'Fulle Name',
               email: 'Email'
             ),
             User.create!(
               fulle_name: 'Fulle Name',
               email: 'Email'
             )
           ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Fulle Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Email'.to_s, count: 2
  end
end
