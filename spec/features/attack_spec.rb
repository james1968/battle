feature 'Attacking' do
  scenario 'attack Player 2' do
    sign_in_and_play
    click_link 'Attack'
    expect(page).to have_content 'Dave attacked Mittens'
    click_button 'OK'
    expect(page).to have_content 'Mittens: 50HP'
  end

  scenario 'attack Player 1' do
    sign_in_and_play
    click_link 'Attack'
    click_button 'OK'
    click_link 'Attack'
    expect(page).to have_content 'Mittens attacked Dave'
    click_button 'OK'
    expect(page).to have_content 'Dave: 50HP'
  end

end
