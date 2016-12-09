require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature  do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make and model year' do
        fill_in 'make', with: 'Tata'
        fill_in 'year', with: '1985'
      end
      And 'I can submit the information' do
        click_button 'Create Car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: Tata')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_content('Lights on: false')
      end
      And 'I can see the speed of the car' do
        expect(page).to have_content('Speed: 0 km/h')
      end
      When 'I can click the accelerate button' do
        click_button 'Accelerate'
      end
      Then 'The speed of the car should be 10 km/h higher' do
        expect(page).to have_content('Speed: 10 km/h')
      end
      When 'I can click the brake button' do
        click_button 'Brake'
      end
      Then 'The speed of the car should be 7 km/h lower' do
        expect(page).to have_content('Speed: 3 km/h')
      end
      When 'I can click the brake button a second time' do
        click_button 'Brake'
      end
      Then 'The speed of the car should be 0 km/h' do
        expect(page).to have_content('Speed: 0 km/h')
      end
      When 'I can click the lights button' do
        click_button 'Lights'
      end
      Then 'The lights on changes to true' do
        expect(page).to have_content('Lights on: true')
      end
      When 'I can click the radio buttons for parking brake', js: true do
        choose("parking_brake", option:'On')
      end
      Then 'The parking brake will be set to on' do
        expect(page).to have_content('Parking brake: On')
      end
    end
  end
end
