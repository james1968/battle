require 'spec_helper'
require_relative 'web_helpers'

feature 'Enter names' do
  scenario 'submitting names' do
    sign_in_and_play
    expect(page).to have_content 'Ned Stark vs. Joffrey Lannister'
  end
end

feature 'Hit Points' do
  scenario 'viewing hit points' do
    sign_in_and_play
    expect(page).to have_content 'Joffrey Lannister HP: 60'
  end
end

feature 'Attacking' do
  scenario 'get confirmation' do
    sign_in_and_play
    click_button 'Attack'
    expect(page).to have_content 'Attack successful!'
  end

  scenario 'reduces hit points' do
    skip
    sign_in_and_play
    click_button 'Attack'
    expect(page).not_to have_content 'Joffrey Lannister HP: 60'
    expect(page).to have_content 'Joffrey Lannister HP: '
  end
end

feature 'Switching turns' do
  context 'seeing the current turn' do
    scenario 'at the start of the game' do
      sign_in_and_play
      expect(page).to have_content "Ned Stark's turn"
    end

    scenario 'after player 1 attacks' do
      sign_in_and_play
      click_button 'Attack'
      click_button 'Next turn'
      expect(page).not_to have_content "Ned Stark's turn"
      expect(page).to have_content "Joffrey Lannister's turn"
    end
  end

  feature 'Losing the game' do
    scenario 'Player 2 loses' do
      sign_in_and_play
      100.times do
        click_button 'Attack'
        break if page.has_content?("lost the game")
        click_button 'Next turn'
      end
      expect(page).to have_content "lost the game"
    end
  end



end
