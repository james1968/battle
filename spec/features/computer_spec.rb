require 'spec_helper'
require_relative 'web_helpers'

feature 'Enter names to play with computer' do
  scenario 'submitting names' do
    visit '/'
    expect(page).to have_content "Play with Computer"
  end
end

feature 'Player 2 is the computer' do
  scenario 'after clicking on Play with Computer' do
    sign_in_and_play_computer
    expect(page).to have_content "Robot (the Computer)"
  end
end

feature 'Can be attacked by computer' do
  scenario 'after attacking computer' do
    sign_in_and_play_computer
    click_button 'Attack'
    click_button 'Next Turn'
    expect(page).to have_content "Robot (the Computer) is attacking you"
  end
end
