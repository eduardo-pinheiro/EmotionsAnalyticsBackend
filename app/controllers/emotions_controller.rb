# frozen_string_literal: true

class EmotionsController < ApplicationController
  def create
    emotion = Emotion.new(emotion_params)

    if emotion.save
      render json: emotion, status: :created
    else
      render json: { errors: emotion.errors }, status: :unprocessable_entity
    end
  end

  def index
    emotions = Emotion.all

    render json: emotions, status: :ok
  end

  def show
    emotions = Emotion.find(params[:id])

    render json: emotions, status: :ok
  end

  def update
    emotion = Emotion.find(params[:id])

    if emotion.update(emotion_params)
      render json: emotion, status: :ok
    else
      render json: { errors: emotions.errors }, status: :unprocessable_entity
    end
  end

  private

  def emotion_params
    params.require(:emotion).permit(:anger, :contempt, :disgusted, :fear,
                                    :joy, :sadness, :valence, :engagement)
  end
end
