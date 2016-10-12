feature 'Win/Lose' do
  scenario 'lose message received if 0HP is reached' do
    sign_in_and_play
    attack_to_death
    expect(page).to have_content "Mittens loses!"
  end
end
