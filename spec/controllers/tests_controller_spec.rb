# frozen_string_literal: true

require "rails_helper"

RSpec.describe TestsController, type: :controller do
  describe "POST /test" do
    test_type = TestType.create(
      start_url: "https://facebook.com",
      objective: "Achar a mina da savero",
      title: 'any_title',
    )

    people = People.create(
      name: "Eduardo",
      email: "eduardo@teste.teste",
      birthday: "20/09/2000"
    )

    request_body = {
      test: {
        abandoned: "true",
        test_type_id: test_type.id,
        people_id: people.id
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new test on database" do
      expect do
        post :create, params: request_body
      end.to change{Test.count}.by(1)
    end
  end

  describe "GET /test" do
    test_type = TestType.create(
      start_url: "https://facebook.com",
      objective: "Achar a mina da savero",
      title: 'any_title'
    )

    people = People.create(
      name: "Eduardo",
      email: "eduardo@teste.teste",
      birthday: "20/09/2000"
    )

    before do
      5.times do
        Test.create(
          abandoned: "true",
          test_type_id: test_type.id,
          people_id: people.id
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new test on database" do
      get :index

      test = Test.all

      expect(response.body).to eq test.to_json
    end
  end

  describe "GET /test/:id" do
    test_type = TestType.create(
      start_url: "https://facebook.com",
      objective: "Achar a mina da savero",
      title: 'any_title'
    )

    people = People.create(
      name: "Eduardo",
      email: "eduardo@teste.teste",
      birthday: "20/09/2000"
    )

    test = nil

    before do
      test = Test.create(
        abandoned: "true",
        test_type_id: test_type.id,
        people_id: people.id
      )
    end

    it "return ok status code" do
      get :show, params: { id: test.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new test on database" do
      get :show, params: { id: test.id }

      test = Test.find test.id

      expect(response.body).to eq test.to_json
    end
  end

  describe "PATCH /test/:id" do
    test_type = TestType.create(
      start_url: "https://facebook.com",
      objective: "Achar a mina da savero",
      title: 'any_title'
    )

    people = People.create(
      name: "Eduardo",
      email: "eduardo@teste.teste",
      birthday: "20/09/2000"
    )

    test = nil

    before do
      test = Test.create(
        abandoned: "true",
        test_type_id: test_type.id,
        people_id: people.id
      )
    end

    expected_test = {
      abandoned: false,
      test_type_id: test_type.id,
      people_id: people.id
    }

    it "return ok status code" do
      patch :update, params: { id: test.id, test: expected_test }

      expect(response).to have_http_status(:ok)
    end

    it "creates new test on database" do
      patch :update, params: { id: test.id, test: expected_test }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_test.stringify_keys
    end
  end
end
