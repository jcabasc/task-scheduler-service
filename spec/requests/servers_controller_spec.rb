require "rails_helper"

describe Api::V1::ServersController do

    describe "#show" do
      let(:json_response) { JSON.parse response.body }
      let(:server) { Fabricate(:server) }
      let(:user) { Fabricate(:user) }
      let(:params) { {auth_token: user.authentication_token} }

      it do
        get "/api/v1/servers/#{server.id}", params
        expect(response).to be_success
        expect(json_response["server"]["name"]).to eql(server.name)
      end
    end

    describe "#index" do
      let(:json_response) { JSON.parse response.body }
      let(:user) { Fabricate(:user) }
      let(:params) { {auth_token: user.authentication_token} }
      before { Fabricate(:server) }

      it "lists all servers" do
        get "/api/v1/servers", params
        expect(response).to be_success
        expect(json_response["servers"].count).to eql(1)
      end
    end
end