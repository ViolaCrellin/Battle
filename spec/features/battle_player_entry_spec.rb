require 'spec_helper'

feature 'Player Set up' do


  scenario 'Signing up' do
    sign_in_and_play
    expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 100 Silent Majority Member Donald Trump HP: 100')
  end

  scenario 'Viewing player two\'s hit points as player one' do
    sign_in_and_play
    expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 100 Silent Majority Member Donald Trump HP: 100')
  end
end
