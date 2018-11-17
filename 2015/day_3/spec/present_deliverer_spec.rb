require 'present_deliverer'

describe PresentDeliverer do
  it 'starts at locations 0,0' do
    expect(subject.location).to eq({x: 0, y: 0})
  end

  it 'has visited 0,0 at initialization' do
    expect(subject.visited).to eq([{x: 0, y: 0}])
  end

  describe '#move' do
    it 'adds new location to list of visited locations' do
      expect{ subject.move('>') }.to change{ subject.visited.length }.by(1)
    end

    it 'should move up when passed a ^' do
      subject.move('^')
      expect(subject.location).to eq({x: 0, y: 1})
    end

    it 'should move down when passed a v' do
      subject.move('v')
      expect(subject.location).to eq({x: 0, y: -1})
    end

    it 'should move left when passed a <' do
      subject.move('<')
      expect(subject.location).to eq({x: -1, y: 0})
    end

    it 'should move right when passed a >' do
      subject.move('>')
      expect(subject.location).to eq({x: 1, y: 0})
    end
  end
end
