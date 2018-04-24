include RSpec

require_relative 'min_binary_heap'

RSpec.describe MinBinaryHeap, type: Class do
  let (:root) { Node.new("The Matrix", 87) }

  let (:heap) { MinBinaryHeap.new(root) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "swaps the nodes if the inserted node is less than parent node" do
      heap.insert(inception)
      expect(heap.root.title).to eq "Inception"
      expect(heap.root.left.title).to eq "The Matrix"
    end
    it "properly inserts a new node as a left child" do
      heap.insert(district)
      expect(heap.root.left.title).to eq "District 9"
    end

    it "properly inserts a new node as a right child" do
      heap.insert(district)
      heap.insert(martian)
      expect(heap.root.right.title).to eq "The Martian"
    end
  end

  describe "#find(data)" do
    it "handles nil gracefully" do
      heap.insert(empire)
      heap.insert(mad_max_2)
      expect(heap.find(nil)).to eq nil
    end

    it "properly finds nodes" do
      heap.insert(pacific_rim)
      heap.insert(district)
      heap.insert(braveheart)
      heap.insert(inception)
      heap.insert(jedi)
      heap.insert(empire)
      heap.insert(donnie)
      expect(heap.find(pacific_rim.title).title).to eq "Pacific Rim"
      expect(heap.find(district.title).title).to eq "District 9"
      expect(heap.find(braveheart.title).title).to eq "Braveheart"
      expect(heap.find(inception.title).title).to eq "Inception"
      expect(heap.find(jedi.title).title).to eq "Star Wars: Return of the Jedi"
      expect(heap.find(empire.title).title).to eq "Star Wars: The Empire Strikes Back"
      expect(heap.find(donnie.title).title).to eq "Donnie Darko"
    end
  end

  describe "#delete(data)" do
    it "handles nil gracefully" do
      expect(heap.delete(nil)).to eq nil
    end

    it "properly deletes a left node" do
      heap.insert(district)
      heap.delete(district.title)
      expect(heap.find(district.title)).to be_nil
    end

    it "properly deletes a right node" do
      heap.insert(district)
      heap.insert(martian)
      heap.delete(martian.title)
      expect(heap.find(martian.title)).to be_nil
    end

    it "properly deletes a left-left node" do
      heap.insert(district)
      heap.insert(martian)
      heap.insert(hope)
      heap.delete(hope.title)
      expect(heap.find(hope.title)).to be_nil
    end
    it "properly deletes a left-right node" do
      heap.insert(district)
      heap.insert(martian)
      heap.insert(hope)
      heap.insert(empire)
      heap.delete(empire.title)
      expect(heap.find(empire.title)).to be_nil
    end
  end

  describe "#printf" do
     specify {
       expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
       heap.insert(hope)
       heap.insert(empire)
       heap.insert(jedi)
       heap.insert(martian)
       heap.insert(pacific_rim)
       heap.insert(inception)
       heap.insert(braveheart)
       heap.insert(shawshank)
       heap.insert(district)
       heap.insert(mad_max_2)
       expect { heap.printf }.to output(expected_output).to_stdout
     }

     specify {
       expected_output = "Pacific Rim: 72\nStar Wars: Return of the Jedi: 80\nBraveheart: 78\nThe Matrix: 87\nThe Shawshank Redemption: 91\nDistrict 9: 90\nInception: 86\nMad Max 2: The Road Warrior: 98\nThe Martian: 92\nStar Wars: The Empire Strikes Back: 94\nStar Wars: A New Hope: 93\n"
       heap.insert(mad_max_2)
       heap.insert(district)
       heap.insert(shawshank)
       heap.insert(braveheart)
       heap.insert(inception)
       heap.insert(pacific_rim)
       heap.insert(martian)
       heap.insert(jedi)
       heap.insert(empire)
       heap.insert(hope)
       expect { heap.printf }.to output(expected_output).to_stdout
     }
  end
end
