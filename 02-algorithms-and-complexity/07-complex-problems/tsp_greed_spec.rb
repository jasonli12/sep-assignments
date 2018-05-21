include RSpec

require_relative 'tsp_greed'

RSpec.describe TravelingSalesman, type: Class do

  let (:a) { Node.new('A', nil) }
  let (:b) { Node.new('B', nil) }
  let (:c) { Node.new('C', nil) }
  let (:d) { Node.new('D', nil) }
  let (:e) { Node.new('E', nil) }
  let (:graph) {TravelingSalesman.new}

  before do
    a.neighbors = [[b, 20], [c, 30], [d, 40], [e, 45]]
    b.neighbors = [[a, 20], [c, 20], [d, 60], [e, 80]]
    c.neighbors = [[a, 30], [b, 20], [d, 15], [e, 35]]
    d.neighbors = [[a, 40], [b, 60], [c, 15], [e, 50]]
    e.neighbors = [[a, 45], [b, 80], [c, 35], [d, 50]]
  end

  describe "#nearest_neighbor" do
    it "expects starting at city a to visit b, c, d, e sequentially based on the closest unvisited city" do
      path = graph.nearest_neighbor(a)
      expect(path).to eq ['A', 'B', 'C', 'D', 'E']
    end

    it "expects starting at city b to visit a, c, d, e sequentially based on the closest unvisited city" do
      path = graph.nearest_neighbor(b)
      expect(path).to eq ['B', 'A', 'C', 'D', 'E']
    end

    it "expects starting at city c to visit d, a, b, e sequentially based on the closest unvisited city" do
      path = graph.nearest_neighbor(c)
      expect(path).to eq ['C', 'D', 'A', 'B', 'E']
    end

    it "expects starting at city d to visit c, b, a, e sequentially based on the closest unvisited city" do
      path = graph.nearest_neighbor(d)
      expect(path).to eq ['D', 'C', 'B', 'A', 'E']
    end

    it "expects starting at city e to visit c, d, a, b sequentially based on the closest unvisited city" do
      path = graph.nearest_neighbor(e)
      expect(path).to eq ['E', 'C', 'D', 'A', 'B']
    end
  end
end
