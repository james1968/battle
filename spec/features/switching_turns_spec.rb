feature 'current player' do
  scenario 'initial player\'s turn' do
    sign_in_and_play
    expect(page).to have_content 'Dave\'s turn'
  end

  scenario 'switching turns' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    expect(page).to have_content 'Mittens\'s turn'
  end
end
