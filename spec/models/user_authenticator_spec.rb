require 'rails_helper'

RSpec.describe UserAuthenticator, type: :model do
  describe "#authenticate" do
    let(:user) { Fabricate(:user) }
    subject { UserAuthenticator.new(email, password) }
    before { subject.authenticate }

    context "success" do
      let(:email) { user.email }
      let(:password) { user.password}
      its(:authenticated?) { should eq true }
    end

    context "failure" do
      let(:email) { user.email }
      let(:password) { "FakePassword!"}
      its(:authenticated?) { should eq false }
      its("error.message") { should eq "Your email or password is incorrect. Please check the information and try again."}
    end
  end
end