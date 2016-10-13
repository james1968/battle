require 'spec_helper'
require_relative 'web_helpers'

feature 'Enter names to play with computer' do
  scenario 'submitting names' do
    visit '/'
    expect(page).to have_content "Play with Computer"
  end
end
