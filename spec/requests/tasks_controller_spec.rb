require "rails_helper"

describe Api::V1::TasksController do

  describe "#create" do
    let(:json_response) { JSON.parse response.body }
    let(:user) { Fabricate(:user) }
    let(:params) { { task: task_params, auth_token: user.authentication_token } }

    context "when successful" do
      let(:task_params) { { name: 'rspec', executable_path: '~/srv/.rspec', days_of_week: 'mon', started_at: Time.now + 1.hours, ended_at: Time.now + 5.hours } }
      it do
        post "/api/v1/tasks", params
        expect(json_response["success"]).to eq true
        expect(json_response["message"]).to eq("The task was saved!")
      end
    end
    context "when unsuccesfull" do
      let(:task_params) { {  name: 'rspec', executable_path: '~/srv/.rspec', days_of_week: 'mon', started_at: Time.now + 4.hours, ended_at: Time.now  + 3.hours } }
      it do
        post "/api/v1/tasks", params
        expect(json_response["success"]).to eq false
        expect(json_response["message"]).to eq("Start date can't be greater than Finish date")
      end
    end
  end

  describe "#delete" do
    let(:json_response) { JSON.parse response.body }
    let(:user) { Fabricate(:user) }
    let(:task) { Fabricate(:task) }
    let(:params) { { auth_token: user.authentication_token } }
    it do
      delete "/api/v1/tasks/#{task.id}", params
      expect(json_response["success"]).to eq true
      expect(json_response["message"]).to eq("The task was removed!")
    end
  end

  describe "#update" do
    let(:user) { Fabricate(:user) }
    let(:task) { Fabricate(:task) }
    let(:json_response) { JSON.parse response.body }
    let(:params) { { auth_token: user.authentication_token, task: task_params } }

    context "when successful" do
      let(:task_params) { { days_of_week: 'tue,wed' } }
      it do
        patch "/api/v1/tasks/#{task.id}", params
        expect(json_response["success"]).to eq true
        expect(json_response["message"]).to eq("The task was saved!")
      end
    end
    context "when unsuccesfull" do
      let(:task_params) { {  started_at: Time.now + 4.hours, ended_at: Time.now  + 3.hours } }
      context "when error validation" do
        it do
          patch "/api/v1/tasks/#{task.id}", params
          expect(json_response["success"]).to eq false
          expect(json_response["message"]).to eq("Start date can't be greater than Finish date")
        end
      end

      context "when not found" do
        it do
          patch "/api/v1/tasks/not_found", params
            expect(response).to_not be_success
            expect(response.status).to eq(404)
        end
      end
    end
  end

    describe "#index" do
      let(:json_response) { JSON.parse response.body }
      let(:user) { Fabricate(:user) }
      let(:params) { {auth_token: user.authentication_token} }

      context "when there are no tasks" do
        it "lists an empty list of results" do
          get "/api/v1/tasks", params
          expect(response).to be_success
          expect(json_response["tasks"]).to eql( [] )
        end
      end

      context "when there are tasks to list" do
        before { Fabricate(:task) }
        it "lists all tasks" do
          get "/api/v1/tasks", params
          expect(response).to be_success
          expect(json_response["tasks"].count).to eql(1)
        end
      end
    end

    describe "#show" do
      let(:json_response) { JSON.parse response.body }
      let(:user) { Fabricate(:user) }
      let(:task) { Fabricate(:task) }
      let(:params) { { auth_token: user.authentication_token } }
      it do
        get "/api/v1/tasks/#{task.id}", params
        expect(response).to be_success
        expect(json_response["task"]["name"]).to eql(task.name)
      end
    end

end