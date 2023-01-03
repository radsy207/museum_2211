require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:patron_1) {Patron.new("Bob", 20)}
  let(:patron_2) {Patron.new("Sally", 20)}

  let(:gems_and_minerals) do 
    Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  let(:dead_seal_scrolls) do 
    Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
  end
  let(:imax) do 
    Exhibit.new({name: "IMAX",cost: 15})
  end
  
  describe '#initialize' do
    it 'exists' do
      expect(dmns).to be_an_instance_of(Museum)
    end

    it 'has attributes' do
      expect(dmns.name).to eq("Denver Museum of Nature and Science")
      expect(dmns.exhibits).to eq([])
    end
  end


end