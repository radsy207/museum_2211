require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do
  let(:dmns) {Museum.new("Denver Museum of Nature and Science")}
  let(:patron_1) {Patron.new("Bob", 20)}
  let(:patron_2) {Patron.new("Sally", 20)}
  let(:patron_3)  {Patron.new("Johnny", 5)}
  let(:gems_and_minerals) do 
    Exhibit.new({name: "Gems and Minerals", cost: 0})
  end
  let(:dead_sea_scrolls) do 
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

  describe '#add_exhibits' do
    it 'adds exhibits to empty array' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      expect(dmns.exhibits).to eq([gems_and_minerals, dead_sea_scrolls, imax])
    end
  end

  describe '#recommend_exhibits' do
    it 'recommends patrons to exhibits' do
      patron_1.add_interest(dead_sea_scrolls)
      patron_1.add_interest(gems_and_minerals)
      patron_2.add_interest(imax)
      expect(dmns.recommend_exhibits(patron_1)).to eq([dead_sea_scrolls, gems_and_minerals])
      expect(dmns.recommend_exhibits(patron_2)).to eq([imax])
    end
  end

  describe '#admit' do
    it 'adds patrons to patrons array' do
      dmns.add_exhibit(gems_and_minerals)
      dmns.add_exhibit(dead_sea_scrolls)
      dmns.add_exhibit(imax)
      expect(dmns.patrons).to eq([])
    end
  end

end