class PeopleController < ApplicationController
  def create
    new_people = People.create(
      name: params['name'],
      email: params['email'],
      birthday: params['birthday']
    )

    render json: new_people, status: 201
  end

  def show
    people = People.find params['id']

    render json: people, status: :ok
  end

  def index
    all_people = People.all

    render json: all_people, status: :ok
  end

  def update
    people = People.find params['id']

    people.name = params['name'] || people.name
    people.email = params['email'] || people.email
    people.birthday = params['birthday'] || people.birthday

    people.save

    render json: people
  end

  private

  def people_params
    params.require(:people).permit(:name, :email, :birthday)
  end
end
