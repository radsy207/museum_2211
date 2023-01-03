require 'rspec'
require './lib/patron'

RSpec.describe Patron do
  let(:patron_1) {Patron.new("Bob", 20)}

  describe '#initialize' do
    it 'exists' do
      expect(patron_1).to be_an_instance_of(Patron)
    end

    it 'has a name' do
      expect(patron_1.name).to eq("Bob")
    end

    it 'has spending money' do
      expect(patron_1.spending_money).to eq(20)
    end

    it 'has an empty array of interests' do
      expect(patron_1.interests).to eq([])
    end
  end

  before do
    patron_1.add_interest("Dead Sea Scrolls")
    patron_1.add_interest("Gems and Minerals")
  end
  
  describe "#add_interest" do
    it 'adds to interests array' do
      expect(patron_1.interests).to eq(["Dead Sea Scrolls", "Gems and Minerals"])
    end
  end


end