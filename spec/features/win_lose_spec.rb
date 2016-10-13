feature 'Lose at 0HP' do
  scenario 'display lose message if player has 0HP' do
    sign_in_and_play
    attack_to_zero
    expect(page).to have_content 'Amaal loses'
    end
end
