# frozen_string_literal: true

require 'minitest'
require 'minitest/autorun'

require_relative '../lib/scc.rb'

class SCCGraphTest < Minitest::Test
  def test_empty
    graph0 = SCCGraph.new
    assert_equal [], graph0.scc
    graph1 = SCCGraph.new(0)
    assert_equal [], graph1.scc
  end

  def test_simple
    graph = SCCGraph.new(2)
    graph.add_edge(0, 1)
    graph.add_edge(1, 0)
    scc = graph.scc
    assert_equal 1, scc.size
  end

  def test_self_loop
    graph = SCCGraph.new(2)
    graph.add_edge(0, 0)
    graph.add_edge(0, 0)
    graph.add_edge(1, 1)
    scc = graph.scc
    assert_equal 2, scc.size
  end

  def test_practice
    graph = SCCGraph.new(6)
    edges = [[1, 4], [5, 2], [3, 0], [5, 5], [4, 1], [0, 3], [4, 2]]
    edges.each { |x, y| graph.add_edge(x, y) }
    groups = graph.scc

    assert_equal 4, groups.size
    assert_equal [5],         groups[0]
    assert_equal [4, 1].sort, groups[1].sort
    assert_equal [2],         groups[2]
    assert_equal [3, 0].sort, groups[3].sort
  end
end
