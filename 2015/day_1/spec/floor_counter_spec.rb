require 'floor_counter'

describe FloorCounter do
  it 'starts at level 0' do
    expect(subject.get_floor).to eq(0)
  end

  describe '#get_final_floor' do
    it 'increases the floor by one if passed a (' do
      subject.get_final_floor('(')
      expect(subject.get_floor).to eq(1)
    end

    it 'decreases the floor by one if passed a )' do
      subject.get_final_floor(')')
      expect(subject.get_floor).to eq(-1)
    end

    it 'can correctly process multiple instructions' do
      subject.get_final_floor('(((()')
      expect(subject.get_floor).to eq(3)
    end
  end

  describe '#detect_basement_entry' do
    it 'returns the index of the instruction which first enters a basement floor' do
      expect(subject.detect_basement_entry(')')).to eq(1)
    end

    it 'correctly processes longer instruction strings' do
      expect(subject.detect_basement_entry('(((()))))')).to eq(9)
    end
  end
end
