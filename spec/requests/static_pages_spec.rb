require 'spec_helper'

describe "Static pages" do
	let(:base_title) {"Sample App"}
  describe "Home page" do
    it "should have title 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/home'
    page.should have_selector('title',
    	:text => "#{base_title} | Home")
    end
  end

  describe "Help page" do
    it "should have content 'Help'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/help'
    page.should have_content('Help')
    end
  end

  describe "Contact" do
    it "should have title 'Contact'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/contact'
    page.should have_selector('title',
    	:text => "#{base_title} | Contact")
    end
  end

  describe "About page" do
    it "should have content 'Sample App'" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
    visit '/static_pages/about'
    page.should have_selector('title',
    	:text => "#{base_title} | About")
    end
  end

end