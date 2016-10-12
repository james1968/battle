def sign_in_and_play
  visit ('/')
  fill_in :player_1_name, with: 'Dave'
  fill_in :player_2_name, with: 'Mittens'
  click_button 'Submit'
end

def attack_to_death
  11.times do
    click_link 'Attack'
    click_button 'OK'
  end
end
