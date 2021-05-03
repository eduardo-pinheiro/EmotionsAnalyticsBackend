# frozen_string_literal: true

require "rails_helper"

RSpec.describe EmotionsController, type: :controller do
  describe "POST /emotions" do
    request_body = {
      emotion: {
        anger: 0.80,
        contempt: 0.50,
        disgusted: 0.65,
        fear: 0.20,
        joy: 0.10,
        sadness: 0.05,
        valence: 0.05,
        engagement: 0.20
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new emotion on database" do
      expect do
        post :create, params: request_body
      end.to change{Emotion.count}.by(1)
    end
  end

  describe "GET /emotions" do
    before do
      5.times do
        Emotion.create(
          anger: 0.80,
          contempt: 0.50,
          disgusted: 0.65,
          fear: 0.20,
          joy: 0.10,
          sadness: 0.05,
          valence: 0.05,
          engagement: 0.20
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new emotion on database" do
      get :index

      emotions = Emotion.all

      expect(response.body).to eq emotions.to_json
    end
  end

  describe "GET /emotions/:id" do
    emotion = nil

    before do
      emotion = Emotion.create(
        anger: 0.80,
        contempt: 0.50,
        disgusted: 0.65,
        fear: 0.20,
        joy: 0.10,
        sadness: 0.05,
        valence: 0.05,
        engagement: 0.20
      )
    end

    it "return ok status code" do
      get :show, params: { id: emotion.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new emotion on database" do
      get :show, params: { id: emotion.id }

      emotion = Emotion.find emotion.id

      expect(response.body).to eq emotion.to_json
    end
  end

  describe "PATCH /emotions/:id" do
    emotion = nil

    before do
      emotion = Emotion.create(
        anger: 0.80,
        contempt: 0.50,
        disgusted: 0.65,
        fear: 0.20,
        joy: 0.10,
        sadness: 0.05,
        valence: 0.05,
        engagement: 0.20
      )
    end

    expected_emotion = {
      anger: 0.90,
      contempt: 0.60,
      disgusted: 0.85,
      fear: 0.30,
      joy: 0.90,
      sadness: 0.05,
      valence: 0.05,
      engagement: 0.20
    }

    it "return ok status code" do
      patch :update, params: { id: emotion.id, emotion: expected_emotion }

      expect(response).to have_http_status(:ok)
    end

    it "creates new emotion on database" do
      patch :update, params: { id: emotion.id, emotion: expected_emotion }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_emotion.stringify_keys
    end
  end
end
