require 'rails_helper'

RSpec.describe 'Creating a category', type: :feature do
  let!(:user) { User.create(name: 'emmy') }

  scenario 'create with valid attributes' do
    visit '/login'
    fill_in 'name', with: 'emmy'
    click_button('Sign In')
    visit new_category_path
    fill_in 'category_name', with: 'running2'
    fill_in 'category_priority', with: '13'
    click_button('Create category')
    expect(page).to have_content('Category created successfully!')
  end
end
