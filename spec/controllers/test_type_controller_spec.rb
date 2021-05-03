# frozen_string_literal: true

require "rails_helper"

RSpec.describe TestTypeController, type: :controller do
  describe "POST /test_type" do
    request_body = {
      test_type: {
        start_url: "https://facebook.com",
	objective: "Achar a mina da savero",
        title: "any title"
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new test_type on database" do
      expect do
        post :create, params: request_body
      end.to change{TestType.count}.by(1)
    end
  end

  describe "GET /test_type" do
    before do
      5.times do
        TestType.create(
          start_url: "https://facebook.com",
	  objective: "Achar a mina da savero",
          title: "any title"
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new test_type on database" do
      get :index

      test_type = TestType.all

      expect(response.body).to eq test_type.to_json
    end
  end

  describe "GET /test_type/:id" do
    test_type = nil

    before do
      test_type = TestType.create(
        start_url: "https://facebook.com",
	objective: "Achar a mina da savero",
        title: "any title"
      )
    end

    it "return ok status code" do
      get :show, params: { id: test_type.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new test_type on database" do
      get :show, params: { id: test_type.id }

      test_type = TestType.find test_type.id

      expect(response.body).to eq test_type.to_json
    end
  end

  describe "PATCH /test_type/:id" do
    test_type = nil

    before do
      test_type = TestType.create(
        start_url: "https://facebook.com",
	objective: "Achar a mina da savero",
        title: "any title"
      )
    end

    expected_test_type = {
      start_url: "https://facebook.com",
      objective: "Achar a mina da savero",
      title: "a good title"
    }

    it "return ok status code" do
      patch :update, params: { id: test_type.id, test_type: expected_test_type }

      expect(response).to have_http_status(:ok)
    end

    it "creates new test_type on database" do
      patch :update, params: { id: test_type.id, test_type: expected_test_type }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_test_type.stringify_keys
    end
  end
end
