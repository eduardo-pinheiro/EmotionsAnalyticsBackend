# frozen_string_literal: true

require "rails_helper"

RSpec.describe PeopleAppearanceController, type: :controller do
  describe "POST /people_appearances" do
    request_body = {
      people_appearance: {
        age: 12,
	gender: "female",
	glasses: 1
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new people_appearance on database" do
      expect do
        post :create, params: request_body
      end.to change{PeopleAppearance.count}.by(1)
    end
  end

  describe "GET /people_appearances" do
    before do
      5.times do
        PeopleAppearance.create(
          age: 12,
	  gender: "female",
	  glasses: 1
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new people_appearance on database" do
      get :index

      people_appearances = PeopleAppearance.all

      expect(response.body).to eq people_appearances.to_json
    end
  end

  describe "GET /people_appearances/:id" do
    people_appearance = nil

    before do
      people_appearance = PeopleAppearance.create(
        age: 12,
	gender: "female",
	glasses: 1
      )
    end

    it "return ok status code" do
      get :show, params: { id: people_appearance.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new people_appearance on database" do
      get :show, params: { id: people_appearance.id }

      people_appearance = PeopleAppearance.find people_appearance.id

      expect(response.body).to eq people_appearance.to_json
    end
  end

  describe "PATCH /people_appearances/:id" do
    people_appearance = nil

    before do
      people_appearance = PeopleAppearance.create(
        age: 12,
	gender: "female",
	glasses: 1
      )
    end

    expected_people_appearance = {
      age: 14,
      gender: "female",
      glasses: 1
    }

    it "return ok status code" do
      patch :update, params: { id: people_appearance.id, people_appearance: expected_people_appearance }

      expect(response).to have_http_status(:ok)
    end

    it "creates new people_appearance on database" do
      patch :update, params: { id: people_appearance.id, people_appearance: expected_people_appearance }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_people_appearance.stringify_keys
    end
  end
end
