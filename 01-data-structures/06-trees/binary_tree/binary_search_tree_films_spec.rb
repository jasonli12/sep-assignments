include RSpec

require_relative 'binary_search_tree'

RSpec.describe BinarySearchTree, type: Class do
  let (:root) { Node.new("Shrek", 88) }

  let (:tree) { BinarySearchTree.new(root) }

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
      tree.insert(root, iron_man_3)
      tree.insert(root, totoro)
      tree.insert(root, despicable_me_3)
      tree.insert(root, harry_potter_3)
      tree.insert(root, moana)
      tree.insert(root, chicken_run)
      tree.insert(root, ice_age)
      tree.insert(root, zootopia)
      tree.insert(root, lion_king)
      tree.insert(root, kung_fu_panda)
      tree.insert(root, captain_underpants)
      expect(root.left.title).to eq "Iron Man 3"
      expect(root.right.title).to eq "My Neighbor Totoro"
      expect(root.left.left.title).to eq "Despicable Me 3"
      expect(root.right.left.title).to eq "Harry Potter and the Prisoner of Azkaban"
      expect(root.right.right.title).to eq "Moana"
      expect(root.right.right.right.title).to eq "Chicken Run"
      expect(root.left.left.right.title).to eq "Ice Age"
      expect(root.right.right.right.right.title).to eq "Zootopia"
      expect(root.right.left.right.title).to eq "The Lion King"
      expect(root.left.right.title).to eq "Kung Fu Panda"
      expect(root.left.right.left.title).to eq "Captain Underpants: The First Epic Movie"
    end
  end
end
