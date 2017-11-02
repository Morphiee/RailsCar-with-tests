require 'rails_helper'

RSpec.feature "SimulateCars", type: :feature do
    context 'Creating a car for simulating' do
      Steps 'Creating a car' do
        Given 'I am on the landing page' do
          visit '/'
        end
        When 'I fill in the car make and model year' do
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
        end
        And 'I can submit the information' do
            click_button 'Create new car'
        end
        Then "I can see the car's info" do
            expect(page).to have_content('Make: DeLorean')
            expect(page).to have_content('Year: 1985')
        end
        And 'I can see the speed of the car' do
            expect(page).to have_content('Speed: 0Km/h')
        end
      end
  end
  context 'Simulating a car' do
    Steps 'Speeding up a car' do
        Given 'I have created a car' do
            visit '/'
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
            click_button 'Create new car'
        end
        Then "the car's speed is 0Km/h" do
            expect(page).to have_content('Speed: 0Km/h')
        end
        When "The parking brake is off" do
            choose 'parking_brake', option: 'off'
            click_button 'Toggle Parking Brake'
        end
        Then "I can click the accelerate button" do
            click_button 'Accelerate'
        end
        Then 'the speed of the car should be 10Km/h higher' do
            expect(page).to have_content('Speed: 10Km/h')
        end
    end
  end
  context 'Simulating a car' do
    Steps 'Slowing down a car' do
        Given 'I have created a car' do
            visit '/'
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
            click_button 'Create new car'
        end
        Then "the car's speed is 0Km/h" do
            expect(page).to have_content('Speed: 0Km/h')
        end
        When "The parking brake is off and I accelerate, then brake" do
            choose 'parking_brake', option: 'off'
            click_button 'Toggle Parking Brake'
            click_button 'Accelerate'
            click_button 'Brake'
        end
        Then 'the speed of the car should be 7Km/h lower' do
            expect(page).to have_content('Speed: 3Km/h')
        end
    end
  end
  context 'Simulating a car' do
    Steps 'Toggle car lights' do
        Given 'I have created a car' do
            visit '/'
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
            click_button 'Create new car'
        end
        Then "The car's lights are off" do
            expect(page).to have_content('Lights: false')
        end
        When "I can click the lights button" do
            click_button 'Lights'
        end
        Then "The car's lights are on" do
            expect(page).to have_content('Lights: true')
        end
    end
  end
  context 'Simulating a car' do
    Steps 'Toggle car parking brake' do
        Given 'I have created a car' do
            visit '/'
            fill_in 'make', with: 'DeLorean'
            fill_in 'model_year', with: '1985'
            click_button 'Create new car'
        end
        Then "The car's parking brake is on" do
            expect(page).to have_content('Parking Brake: on')
        end
        When "I can click the radio buttons" do
            choose 'parking_brake', option: 'off'
            click_button 'Toggle Parking Brake'
        end
        Then "The car's parking brake is off" do
            expect(page).to have_content('Parking Brake: off')
        end
    end
  end
end
