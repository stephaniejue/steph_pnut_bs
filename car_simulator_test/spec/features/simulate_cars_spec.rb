require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature  do
  context 'Creating a car for simulating' do
    Steps 'Creating a car' do
      Given 'I am on the landing page' do
        visit '/'
      end
      When 'I fill in the car make, model year, and color' do
        fill_in 'make', with: 'Tata'
        fill_in 'year', with: '1985'
        fill_in 'color', with: '#ff0000'
      end
      And 'I can submit the information' do
        click_button 'Create Car'
      end
      Then "I can see the car's info" do
        expect(page).to have_content('Make: Tata')
        expect(page).to have_content('Year: 1985')
        expect(page).to have_content('Lights on: false')
        expect(page.cell_element(:id => "make_color").style('background-color')).to eq('rgba(255, 0, 0, 1)')
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
      When 'I can click the radio buttons for parking brake', :js => true do
        page.choose("parking_brake", option: "On")
      end
      And 'I can click submit' do
        click_button 'Set'
      end
      Then 'The parking brake will be set to on' do
        expect(page).to have_content('Parking brake: On')
      end
      When 'I can click the accelerate button' do
        click_button 'Accelerate'
      end
      And 'Nothing will happen because the button is disabled' do
        expect(page).to have_content('Speed: 0 km/h')
      end
      When 'I set the parking brake to off' do
        page.choose("parking_brake", option: "Off")
        click_button 'Set'
        click_button 'Accelerate'
      end
      Then 'I cannot set the parking brake on since speed is above 0 km/h' do
        page.choose("parking_brake", option: "On")
        click_button 'Set'
        expect(page).to have_content('Parking brake: Off')
        expect(page).to have_content('Speed: 10 km/h')
      end
    end
  end
end

# When 'I can click the radio buttons for parking brake', :js => true do
#   page.choose("parking_brake", option: "On")
# end
# Then 'The parking brake will be set to on' do
#   expect(page).to have_content('Parking brake: On')
# end
