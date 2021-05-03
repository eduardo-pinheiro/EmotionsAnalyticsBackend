# frozen_string_literal: true

module GraphCalculators
  class Emotions
    def initialize(test:)
      @test = test
    end

    def generate_graph
      emotions_attributes.map do |emotion_attribute|
        emotion_data = occurrences.map { |occurrence| occurrence.emotion.send(emotion_attribute) }

        emotion_average = emotion_data.reduce(:+) / occurrences.count

        Hash[emotion_attribute, emotion_average]
      end.inject(:merge)
    end

    private

    def emotions_attributes
      @emotions_attributes ||= Emotion.column_names.drop(1)[0..-3] - ["disgusted"]
    end

    def occurrences
      Occurrence.where(test: @test)
    end
  end
end
