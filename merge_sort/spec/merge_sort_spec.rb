require_relative '../lib/merge_sort.rb'

describe "#merge_sort" do
  it "Return the correct order of few random array" do
    array = Array.new(10000) {rand(1..100000)}
    expect(merge_sort(array, 0 , array.length)).to eq(array.sort)
  end

  it "Return the correct order of few given array" do
    array = [8, 3, 44, 2, 12, 43, 65]
    expect(merge_sort(array, 0 , array.length)).to eq(array.sort)
  end
end
