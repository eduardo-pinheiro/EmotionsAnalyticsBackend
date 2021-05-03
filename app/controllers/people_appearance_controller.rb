class PeopleAppearanceController < ApplicationController
  def create
    new_record = PeopleAppearance.create(
      age: params['age'],
      gender: params['gender'],
      glasses: params['glasses']
    )

    render json: new_record, status: 201
  end

  def show
    people_appearence = PeopleAppearance.find params['id']

    render json: people_appearence
  end

  def index
    all_people_appearence = PeopleAppearance.all

    render json: all_people_appearence
  end

  def update
    record = PeopleAppearance.find params['id']

    record.age = params['age'] || record.age
    record.gender = params['gender'] || record.gender
    record.glasses = params['glasses'] || record.glasses

    record.save

    render json: record
  end
end
