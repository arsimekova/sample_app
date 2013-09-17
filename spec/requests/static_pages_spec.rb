require 'spec_helper'

describe "Static pages" do
  describe "Home page" do
    it "should have content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/home'
    page.should have_selector('title',
    	:text => "Sample App | Home")
    end
  end

  describe "Help page" do
    it "should have content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/help'
    page.should have_content('Help')
    end
  end

  describe "About page" do
    it "should have content 'About us'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/about'
    page.should have_content('About us')
    end
  end

end