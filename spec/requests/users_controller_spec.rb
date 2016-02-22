require "rails_helper"

describe Api::V1::UsersController do
    describe "#show" do
      let(:json_response) { JSON.parse response.body }
      let(:user) { Fabricate(:user) }
      it do
        get "/api/v1/users/#{user.id}"
        expect(response).to be_success
        expect(json_response["user"]["email"]).to eql(user.email)
      end
    end
end