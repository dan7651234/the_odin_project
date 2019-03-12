require 'enum'

describe Enumerable do
  let(:test_arr) {[1,2,3,4,5]}
  let(:result) {[]}

  describe '#my_each' do
    it "touches every element of the array" do
      test_arr.my_each {|item| result << item}
      expect(result).to eq([1,2,3,4,5])
    end
  end

  describe '#my_all?' do
    it "returns true if all elements are truish" do
      result = test_arr.my_all?
      expect(result).to eq(true)
    end
  end

  describe '#my_select' do
    it "returns array of items that match given criteria" do
      result = test_arr.my_select {|item| item % 2 == 0}
      expect(result).to eq([2,4])
    end
  end

  describe '#my_count' do
    it "counts elements of given array"
end
