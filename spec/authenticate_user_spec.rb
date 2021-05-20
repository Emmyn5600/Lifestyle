require 'rails_helper'

RSpec.describe 'Sign In a user', type: :feature do
  let!(:user) { User.create(name: 'emmy') }

  scenario 'sign in successfully' do
    visit '/login'
    fill_in 'name', with: 'emmy'
    click_button('Sign In')
    visit new_category_path
    expect(page).to have_current_path('/categories/new')
  end
end
