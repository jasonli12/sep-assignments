include RSpec

require_relative 'kevin_bacon'

RSpec.describe KevinBacon, type: Class do

  let (:a) { Node.new('A', nil) }
  let (:b) { Node.new('B', nil) }
  let (:e) { Node.new('E', nil) }
  let (:d) { Node.new('D', nil) }
  let (:r) { Node.new('R', nil) }
  let (:c) { Node.new('C', nil) }
  let (:f) { Node.new('F', nil) }
  let (:g) { Node.new('G', nil) }
  let (:kb) { Node.new('Kevin Bacon', nil) }

  before do
    a.film_actor_hash = {X: [b, e], Y: [c]}
    b.film_actor_hash = {X: [a, e], G: [d, r]}
    e.film_actor_hash = {X: [a, b], M: [kb]}
    d.film_actor_hash = {G: [b,r]}
    r.film_actor_hash = {G: [b,d]}
    c.film_actor_hash = {Y: [a]}
    f.film_actor_hash = {T: [g]}
    g.film_actor_hash = {T: [f]}
    kb.film_actor_hash = {M: [e]}
  end

  describe "#find_kevin_bacon(start_node)" do
    it "expects f to not be connected to Kevin Bacon" do
      f_graph = KevinBacon.new(f)
      expect(f_graph.find_kevin_bacon(f)).to eq "Not Found"
    end

    it "expects g to not be connected to Kevin Bacon" do
      g_graph = KevinBacon.new(g)
      expect(g_graph.find_kevin_bacon(g)).to eq "Not Found"
    end

    it "expects a to be connected to Kevin Bacon through film X and film M" do
      a_graph = KevinBacon.new(a)
      expect(a_graph.find_kevin_bacon(a)).to eq [:X, :M]
    end

    it "expects c to be connected to Kevin Bacon through film Y, film X and film M" do
      c_graph = KevinBacon.new(c)
      expect(c_graph.find_kevin_bacon(c)).to eq [:Y, :X, :M]
    end

    it "expects r to be connected to Kevin Bacon through film G, film X and film M" do
      r_graph = KevinBacon.new(r)
      expect(r_graph.find_kevin_bacon(r)).to eq [:G, :X, :M]
    end
  end
end
