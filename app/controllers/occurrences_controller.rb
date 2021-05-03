# frozen_string_literal: true

class OccurrencesController < ApplicationController
  def create
    test = Test.find occurrence_params[:test][:id]

    expression = Expression.create(occurrence_params[:expression])

    emotion = Emotion.create(occurrence_params[:emotion])

    people_appearance = PeopleAppearance.create(params[:people_appearance])

    occurrence = Occurrence.new(
      test_id: test.id,
      expression_id: expression.id,
      emotion_id: emotion.id,
      people_appearance_id: people_appearance.id
    )

    if occurrence.save
      render json: occurrence, status: :created
    else
      render json: { errors: occurrence.errors }, status: :unprocessable_entity
    end
  end

  def index
    occurrences = Occurrence.all

    render json: occurrences, status: :ok
  end

  def show
    occurrences = Occurrence.find(params[:id])

    render json: occurrences, status: :ok
  end

  def update
    occurrence = Occurrence.find(params[:id])

    if occurrence.update(occurrence_params)
      render json: occurrence, status: :ok
    else
      render json: { errors: occurrences.errors }, status: :unprocessable_entity
    end
  end

  private

  def occurrence_params
    params.require(:occurrence).permit(test: :id,
                                        expression: expression_params,
                                        emotion: emotion_params,
                                        people_appearance: people_appearance_params,
                                      ).to_h
  end

  def people_appearance_params
    @people_appearance_params ||= %i[
      age
      gender
      glasses
    ]
  end

  def emotion_params
    @emotion_params ||= %i[
      anger
      contempt
      disgusted
      fear
      joy
      sadness
      valence
      engagement
    ]
  end

  def expression_params
    @expression_params ||= %i[
      attention
      brow_furrow
      brow_raise
      cheek_raise
      chin_raise
      dimpler
      eye_closure
      eye_widen
      inner_brow_raise
      jaw_drop
      lid_tighten
      lip_corner_depressor
      lip_press
      lip_pucker
      lip_stretch
      lip_suck
      mouth_open
      nose_wrinkle
      smile
      smirk
      upper_lip_raise
    ]
  end
end
