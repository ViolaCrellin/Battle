require 'spec_helper'

feature 'Game play' do


  scenario 'Corbyn Attacking' do
    sign_in_and_play
    find('#left_attack').click_button("Attack@!£!$!%")
    expect(page).to have_content('Jez Corbyn attacked Donald Trump')
  end

context 'Corbyn\'s attack' do
  before do
    sign_in_and_play
    allow(Kernel).to receive(:rand).and_return(10)
    find('#left_attack').click_button("Attack@!£!$!%")
    click_button "OK"
  end

  scenario 'Corybn reduces Trump\'s HP' do
    expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 100 Silent Majority Member Donald Trump HP: 90')
  end

  scenario 'Trump Attacking' do
    find('#right_attack').click_button("Attack@!£!$!%")
    expect(page).to have_content('Donald Trump attacked Jez Corbyn')
  end

  scenario 'Trump reduces Corbyn\'s HP' do
    find('#right_attack').click_button("Attack@!£!$!%")
    click_button "OK"
    expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 90 Silent Majority Member Donald Trump HP: 90')
  end

  scenario 'Corybn can\'t attack when it is not his turn' do
    find('#left_attack').click_button("Attack@!£!$!%")
    expect(page).to have_content("Wait your turn!")
  end


  scenario 'Corbyn doesn\'t reduce Trump\'s HP when not his turn' do
      find('#left_attack').click_button("Attack@!£!$!%")
      click_button "OK"
    expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 100 Silent Majority Member Donald Trump HP: 90')
  end

end

context 'Trump game play' do

before do
  sign_in_and_play
  allow(Kernel).to receive(:rand).and_return(10)
end

    scenario 'Trump can\'t attack when it is not his turn' do
      find('#right_attack').click_button("Attack@!£!$!%")
      expect(page).to have_content("Wait your turn!")
    end

    scenario 'Trump doesn\'t reduce Corbyn\'s HP when not his turn, but has been attacked once' do
      find('#left_attack').click_button("Attack@!£!$!%")
      click_button "OK"
      2.times do
        find('#right_attack').click_button("Attack@!£!$!%")
        click_button "OK"
      end
      expect(page).to have_content('Corbynista Crew Member Jez Corbyn HP: 90 Silent Majority Member Donald Trump HP: 90')
    end

    scenario 'Corbyn declared winner' do
      9.times do
        find('#left_attack').click_button("Attack@!£!$!%")
        click_button "OK"
        find('#right_attack').click_button("Attack@!£!$!%")
        click_button "OK"
      end
      find('#left_attack').click_button("Attack@!£!$!%")
      expect(page).to have_content("Jez Corbyn WINS!! GO SOCIALISM!!")
    end

  end

end
