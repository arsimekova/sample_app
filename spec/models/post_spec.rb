require 'spec_helper'

describe Post do
  let(:user) {FactoryGirl.create(:user)}
  	before {@post = user.posts.build(topic: "First", content: "Lorem ipsum")}


  	subject { @post }

  	it { should respond_to(:topic) }
  	it { should respond_to(:content) }
  	it { should respond_to(:user_id) }
  	it { should respond_to(:user) }
  	its(:user) {should == user}
  	it { should be_valid }

	describe "when user_id is not present" do
	    before { @post.user_id = nil }
	    it { should_not be_valid }
	end

  	describe "accessible attributes" do
  		it "should not allow access to user_id" do
  			expect do
  				Post.new(user_id: user.id)
  			end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
  		end
  	end
end
