# frozen_string_literal: true

class TestTypeController < ApplicationController
  def create
    new_record = TestType.create(
      start_url: params['start_url'],
      objective: params['objective'],
      title: params['title']
    )

    render json: new_record, status: 201
  end

  def show
    test_type = TestType.find params['id']

    render json: test_type
  end

  def index
    all_test_types = TestType.all

    render json: all_test_types
  end

  def update
    record = TestType.find params['id']

    record.start_url = params['start_url'] || record.start_url
    record.objective = params['objective'] || record.objective
    record.title = params['title'] || record.title

    record.save

    render json: record
  end
end
