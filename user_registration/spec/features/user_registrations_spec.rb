require 'rails_helper'

RSpec.feature "UserRegistrations", type: :feature do
  context 'Going to website' do
    Steps 'Being welcomed' do
      Given 'I am on the user registration page' do
        visit '/'
      end
      Then 'I can see a welcome message' do
        expect(page).to have_content("Welcome!")
      end
      When 'I fill in the user registraion information' do
        fill_in 'full_name', with: 'Capy Bara'
        fill_in 'address', with: '1550 Market Street'
        fill_in 'city', with: 'San Diego'
        fill_in 'state', with: 'California'
        fill_in 'zip_code', with: '12345'
        fill_in 'country', with: 'USA'
        fill_in 'email', with: 'Capy.Bara@LEARNAcademy.com'
        fill_in 'user_id', with: 'capyb'
        fill_in 'password', with: 'arabypac'
      end
      And 'I can submit the information' do
        click_button 'Submit'
      end
      Then 'I can see my user information' do
        expect(page).to have_content('Full name: Capy Bara')
        expect(page).to have_content('Street address: 1550 Market Street')
        expect(page).to have_content('City: San Diego')
        expect(page).to have_content('State: California')
        expect(page).to have_content('Postal code: 12345')
        expect(page).to have_content('Country: USA')
        expect(page).to have_content('Email address: Capy.Bara@LEARNAcademy.com')
        expect(page).to have_content('User ID: capyb')
        expect(page).to have_content('Password: arabypac')
      end
    end
  end
end
