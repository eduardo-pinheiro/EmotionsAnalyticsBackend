# frozen_string_literal: true

require "rails_helper"

RSpec.describe PeopleController, type: :controller do
  describe "POST /people" do
    request_body = {
      people: {
        name: "Eduardo",
	email: "eduardo@teste.teste",
	birthday: "20/09/2000"
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new people on database" do
      expect do
        post :create, params: request_body
      end.to change{People.count}.by(1)
    end
  end

  describe "GET /people" do
    before do
      5.times do
        People.create(
          name: "Eduardo",
	  email: "eduardo@teste.teste",
	  birthday: "20/09/2000"
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new people on database" do
      get :index

      people = People.all

      expect(response.body).to eq people.to_json
    end
  end

  describe "GET /people/:id" do
    people = nil

    before do
      people = People.create(
        name: "Eduardo",
	email: "eduardo@teste.teste",
	birthday: "20/09/2000"
      )
    end

    it "return ok status code" do
      get :show, params: { id: people.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new people on database" do
      get :show, params: { id: people.id }

      people = People.find people.id

      expect(response.body).to eq people.to_json
    end
  end

  describe "PATCH /people/:id" do
    people = nil

    before do
      people = People.create(
        name: "Eduardo",
	email: "eduardo@teste.teste",
	birthday: "20/09/2000"
      )
    end

    expected_people = {
      name: "Eduardo F P",
      email: "eduardo@teste.teste",
    }

    it "return ok status code" do
      patch :update, params: { id: people.id, people: expected_people }

      expect(response).to have_http_status(:ok)
    end

    it "creates new people on database" do
      patch :update, params: { id: people.id, people: expected_people }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_people.stringify_keys
    end
  end
end
