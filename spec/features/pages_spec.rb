require 'spec_helper'

describe 'Static pages' do

  describe 'Home page' do
    it "should have content 'Welcome'" do
      visit root_path
      expect(page).to have_content('Welcome')
    end
    it "should have title 'Roomswap | Home'" do
      visit root_path
      expect(page).to have_title("Roomswap | Home")
    end
  end

  describe "Help page" do
    it "should have content 'Help'" do
      visit '/help'
      expect(page).to have_content('Help')
    end
    it "should have title 'Roomswap | Help'" do
      visit '/help'
      expect(page).to have_title("Roomswap | Help")
    end

  end

  describe "Contact page" do
    it "should have content 'Contact Us'" do
      visit '/contact'
      expect(page).to have_content('Contact Us')
    end
    it "should have title 'Roomswap | Contact Us'" do
      visit '/contact'
      expect(page).to have_title("Roomswap | Contact Us")
    end
  end

end