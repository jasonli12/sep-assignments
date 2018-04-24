include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("Shrek", 88) }

  let (:heap) { MinBinaryHeap.new(root) }

  let(:iron_man_3) { Node.new("Iron Man 3", 80) }
  let (:totoro) { Node.new("My Neighbor Totoro", 94) }
  let(:despicable_me_3) { Node.new("Despicable Me 3", 59) }
  let(:harry_potter_3) { Node.new("Harry Potter and the Prisoner of Azkaban", 91) }
  let(:moana) { Node.new("Moana", 96) }
  let(:chicken_run) { Node.new("Chicken Run", 97) }
  let(:ice_age) { Node.new("Ice Age",  77) }
  let (:zootopia) { Node.new("Zootopia", 98) }
  let (:lion_king) { Node.new("The Lion King", 92) }
  let (:kung_fu_panda) { Node.new("Kung Fu Panda", 87) }
  let (:captain_underpants) { Node.new("Captain Underpants: The First Epic Movie", 86) }

  describe "#insert(data)" do
    it "properly inserts nodes" do
      heap.insert(iron_man_3)
      heap.insert(totoro)
      heap.insert(despicable_me_3)
      heap.insert(harry_potter_3)
      heap.insert(moana)
      heap.insert(chicken_run)
      heap.insert(ice_age)
      heap.insert(zootopia)
      heap.insert(lion_king)
      heap.insert(kung_fu_panda)
      heap.insert(captain_underpants)
      expect(heap.root.title).to eq "Despicable Me 3"
      expect(heap.root.left.title).to eq "Ice Age"
      expect(heap.root.right.title).to eq "Captain Underpants: The First Epic Movie"
      expect(heap.root.left.left.title).to eq "Iron Man 3"
      expect(heap.root.left.right.title).to eq "Kung Fu Panda"
      expect(heap.root.right.left.title).to eq "My Neighbor Totoro"
      expect(heap.root.right.right.title).to eq "Chicken Run"
      expect(heap.root.left.left.left.title).to eq "Shrek"
      expect(heap.root.left.left.right.title).to eq "Zootopia"
      expect(heap.root.left.right.left.title).to eq "The Lion King"
      expect(heap.root.left.right.right.title).to eq "Harry Potter and the Prisoner of Azkaban"
      expect(heap.root.right.left.left.title).to eq "Moana"
    end
  end
end
