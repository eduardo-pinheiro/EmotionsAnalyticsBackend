# frozen_string_literal: true

module Graph
  class EmotionsController < ApplicationController
    def generate
      test = Test.find params[:id]

      data = ::GraphCalculatorService.new(test: test, graph: :emotions).call

      render json: data, status: :ok
    end
  end
end

