require "rails_helper"

describe Api::V1::LogsController do
    describe "#index" do
      let(:json_response) { JSON.parse response.body }
      let(:user) { Fabricate(:user) }
      let(:params) { {auth_token: user.authentication_token} }

      context "with failing tasks" do
        before { Fabricate(:task, status: "failed") }
        it "lists all servers" do
          get "/api/v1/logs", params
          expect(response).to be_success
          expect(json_response["logs"].count).to eql(1)
        end
      end
      context "without failing tasks" do
        before { Fabricate(:task, status: "succeeded") }
        it "lists all servers" do
          get "/api/v1/logs", params
          expect(response).to be_success
          expect(json_response["logs"].count).to eql(0)
        end
      end
    end
end