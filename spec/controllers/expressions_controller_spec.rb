# frozen_string_literal: true

require "rails_helper"

RSpec.describe ExpressionsController, type: :controller do
  describe "POST /expressions" do
    request_body = {
      expression: {
        attention: 0.80,
        brow_furrow: 0.1,
        brow_raise: 0.30,
        cheek_raise: 0.10,
        chin_raise: 0.01,
        dimpler: 0.99,
        eye_closure: 0.90,
        eye_widen: 0.77,
        inner_brow_raise: 0.50,
        jaw_drop: 0.50,
        lid_tighten: 0.20,
        lip_corner_depressor: 0.40,
        lip_press: 0.50,
        lip_pucker: 0.20,
        lip_stretch: 0.25,
        lip_suck: 0.30,
        mouth_open: 0.10,
        nose_wrinkle: 0.15,
        smile: 0.05,
        smirk: 0.10,
        upper_lip_raise: 0.30
      }
    }

    it "return created status code" do
      post :create, params: request_body

      expect(response).to have_http_status(:created)
    end

    it "creates new expression on database" do
      expect do
        post :create, params: request_body
      end.to change{Expression.count}.by(1)
    end
  end

  describe "GET /expressions" do
    before do
      5.times do
        Expression.create(
          attention: 0.80,
          brow_furrow: 0.1,
          brow_raise: 0.30,
          cheek_raise: 0.10,
          chin_raise: 0.01,
          dimpler: 0.99,
          eye_closure: 0.90,
          eye_widen: 0.77,
          inner_brow_raise: 0.50,
          jaw_drop: 0.50,
          lid_tighten: 0.20,
          lip_corner_depressor: 0.40,
          lip_press: 0.50,
          lip_pucker: 0.20,
          lip_stretch: 0.25,
          lip_suck: 0.30,
          mouth_open: 0.10,
          nose_wrinkle: 0.15,
          smile: 0.05,
          smirk: 0.10,
          upper_lip_raise: 0.30
        )
      end
    end

    it "return ok status code" do
      get :index

      expect(response).to have_http_status(:ok)
    end

    it "creates new expression on database" do
      get :index

      expressions = Expression.all

      expect(response.body).to eq expressions.to_json
    end
  end

  describe "GET /expressions/:id" do
    expression = nil

    before do
      expression = Expression.create(
        attention: 0.80,
	brow_furrow: 0.1,
	brow_raise: 0.30,
	cheek_raise: 0.10,
	chin_raise: 0.01,
	dimpler: 0.99,
	eye_closure: 0.90,
	eye_widen: 0.77,
	inner_brow_raise: 0.50,
	jaw_drop: 0.50,
	lid_tighten: 0.20,
	lip_corner_depressor: 0.40,
	lip_press: 0.50,
	lip_pucker: 0.20,
	lip_stretch: 0.25,
	lip_suck: 0.30,
	mouth_open: 0.10,
	nose_wrinkle: 0.15,
	smile: 0.05,
	smirk: 0.10,
	upper_lip_raise: 0.30
      )
    end

    it "return ok status code" do
      get :show, params: { id: expression.id }

      expect(response).to have_http_status(:ok)
    end

    it "creates new expression on database" do
      get :show, params: { id: expression.id }

      expression = Expression.find expression.id

      expect(response.body).to eq expression.to_json
    end
  end

  describe "PATCH /expressions/:id" do
    expression = nil

    before do
      expression = Expression.create(
	attention: 0.80,
	brow_furrow: 0.1,
	brow_raise: 0.30,
	cheek_raise: 0.10,
	chin_raise: 0.01,
	dimpler: 0.99,
	eye_closure: 0.90,
	eye_widen: 0.77,
	inner_brow_raise: 0.50,
	jaw_drop: 0.50,
	lid_tighten: 0.20,
	lip_corner_depressor: 0.40,
	lip_press: 0.50,
	lip_pucker: 0.20,
	lip_stretch: 0.25,
	lip_suck: 0.30,
	mouth_open: 0.10,
	nose_wrinkle: 0.15,
	smile: 0.05,
	smirk: 0.10,
	upper_lip_raise: 0.30
      )
    end

    expected_expression = {
      attention: 0.20,
      brow_furrow: 0.30,
      brow_raise: 0.20,
      cheek_raise: 0.40,
      chin_raise: 0.01,
      dimpler: 0.50,
      eye_closure: 0.20,
      eye_widen: 0.77,
      inner_brow_raise: 0.50,
      jaw_drop: 0.50,
      lid_tighten: 0.20,
      lip_corner_depressor: 0.40,
      lip_press: 0.50,
      lip_pucker: 0.20,
      lip_stretch: 0.25,
      lip_suck: 0.30,
      mouth_open: 0.10,
      nose_wrinkle: 0.15,
      smile: 0.15,
      smirk: 0.20,
      upper_lip_raise: 0.40
    }

    it "return ok status code" do
      patch :update, params: { id: expression.id, expression: expected_expression }

      expect(response).to have_http_status(:ok)
    end

    it "creates new expression on database" do
      patch :update, params: { id: expression.id, expression: expected_expression }

      parsed_response = JSON.parse(response.body)

      parsed_response.delete_if{ |k,| ["id", "created_at", "updated_at"].include? k }

      expect(parsed_response).to eq expected_expression.stringify_keys
    end
  end
end
