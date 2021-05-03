# frozen_string_literal: true

class TestsController < ApplicationController
  def create
    test = Test.new(test_params)

    if test.save
      render json: test, status: :created
    else
      render json: { errors: test.errors }, status: :unprocessable_entity
    end
  end

  def index
    tests = Test.all

    render json: tests, status: :ok
  end

  def show
    tests = Test.find(params[:id])

    render json: tests, status: :ok
  end

  def update
    test = Test.find(params[:id])

    if test.update(test_params)
      render json: test, status: :ok
    else
      render json: { errors: test.errors }, status: :unprocessable_entity
    end
  end

  private

  def test_params
    params.require(:test).permit(:abandoned, :test_type_id, :people_id)
  end
end
