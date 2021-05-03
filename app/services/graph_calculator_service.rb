# frozen_string_literal: true

class GraphCalculatorService
  attr_reader :graph, :test

  def initialize(test:, graph:)
    @test = test
    @graph = graph
  end

  def call
    graph_class.new(test: test).generate_graph
  end

  private

  def graph_class
    @graph_class ||= "GraphCalculators::#{graph.to_s.camelize}".constantize
  end
end
