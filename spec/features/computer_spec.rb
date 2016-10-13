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
    expect(page).to have_content "Robot(the Computer)"
  end
end
