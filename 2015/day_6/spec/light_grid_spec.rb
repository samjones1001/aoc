require 'light_grid'

describe LightGrid do
  let(:grid)          { described_class.new(light_klass) }
  let(:light_klass)   { double :light_klass, :new => light }
  let(:light)         { double :light }

  it 'contains 1000000 lights!' do
    expect(subject.lights.length).to eq(1000000)
  end

  describe '#instruct_light' do
    it 'can tell a light to toggle' do
      expect(light).to receive(:toggle)
      grid.instruct_light('toggle', light)
    end

    it 'can tell a light to switch on' do
      expect(light).to receive(:switch_on)
      grid.instruct_light('on', light)
    end

    it 'can tell a light to switch off' do
      expect(light).to receive(:switch_off)
      grid.instruct_light('off', light)
    end
  end

  context 'when all lights are off' do
    describe '#on_count' do
      it 'returns 0' do
        allow(light).to receive(:on?).and_return(false)
        expect(grid.on_count).to eq(0)
      end
    end
  end

  context 'when all lights are on' do
    describe '#on_count' do
      it 'returns 1000000' do
        allow(light).to receive(:on?).and_return(true)
        expect(grid.on_count).to eq(1000000)
      end
    end
  end
end
