# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
                            fulle_name: 'Fulle Name',
                            email: 'Email'
                          ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Fulle Name/)
    expect(rendered).to match(/Email/)
  end
end
