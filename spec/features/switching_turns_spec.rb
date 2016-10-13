feature 'current player' do
  scenario 'initial player\'s turn' do
    sign_in_and_play
    expect(page).to have_content "Snuggles's turn"
    end

  scenario 'switching turns' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    expect(page).to have_content 'Amaal\'s turn'
  end


end
