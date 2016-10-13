def sign_in_and_play
  visit('/')
  fill_in :player_one_name, with: 'Ned Stark'
  fill_in :player_two_name, with: 'Joffrey Lannister'
  click_button 'Submit'
end

def sign_in_and_play_computer
  visit('/')
  fill_in :player_one_name, with: 'Human'
  fill_in :player_two_name, with: 'Robot'
  click_button 'Play with Computer'
end
