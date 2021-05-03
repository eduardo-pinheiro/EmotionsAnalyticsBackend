# frozen_string_literal: true

class ExpressionsController < ApplicationController
  def create
    expression = Expression.new(expression_params)

    if expression.save
      render json: expression, status: :created
    else
      render json: { errors: expression.errors }, status: :unprocessable_entity
    end
  end

  def index
    expressions = Expression.all

    render json: expressions, status: :ok
  end

  def show
    expressions = Expression.find(params[:id])

    render json: expressions, status: :ok
  end

  def update
    expression = Expression.find(params[:id])

    if expression.update(expression_params)
      render json: expression, status: :ok
    else
      render json: { errors: expressions.errors }, status: :unprocessable_entity
    end
  end

  private

  def expression_params
    params.require(:expression).permit(:attention, :brow_furrow, :brow_raise,
                                       :cheek_raise, :chin_raiser, :dimpler,
                                       :eye_closure, :eye_widen,
                                       :inner_brow_raise, :jaw_drop,
                                       :lid_tighten, :lip_corner_depressor,
                                       :lip_press, :lip_pucker, :lip_stretch,
                                       :lip_suck, :mouth_open, :nose_wrinkle,
                                       :smile, :smirk, :upper_lip_raise)
  end
end
