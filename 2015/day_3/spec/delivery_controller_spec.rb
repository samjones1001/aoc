require 'delivery_controller'

describe DeliveryController do
  let(:controller)              { described_class.new(deliverer_klass: mock_deliverer_klass) }
  let(:multiple_controller)     { described_class.new(deliverer_count: 2, deliverer_klass: mock_deliverer_klass)}
  let(:mock_deliverer_klass)    { double :present_deliverer_klass, :new => mock_deliverer }
  let(:mock_deliverer)          { double :present_deliverer, :visited => [{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}], :move => nil }
  let(:mock_deliverer_2)        { double :present_deliverer, :visited => [{x: 0, y: 0}, {x: 1, y: 0}], :move => nil }

  it 'is initialized with a single deliverer by default' do
    expect(controller.deliverers.length).to eq(1)
  end

  it 'can be initialized with multiple deliverers' do
    expect(multiple_controller.deliverers.length).to eq(2)
  end

  describe '#process_deliveries' do
    it 'counts the deliveries which have been made' do
      expect(controller.process_deliveries('<>')).to eq(3)
    end

    it 'ingores duplicate locations' do
      allow(mock_deliverer).to receive(:visited).and_return([{x: 0, y: 0}, {x: 0, y: 1}, {x: 0, y: 2}, {x: 0, y: 2}])
      expect(controller.process_deliveries('<>')).to eq(3)
    end

    it 'calculates correctly when there is more than one deliverer' do
      multiple_controller.deliverers[0] = mock_deliverer
      multiple_controller.deliverers[1] = mock_deliverer_2

      expect(multiple_controller.process_deliveries('<>')).to eq(4)
    end

    context 'when there is a single deliverer' do
      it 'passes the full list of instructions to the deliverer' do
        expect(mock_deliverer).to receive(:move).exactly(4).times
        controller.process_deliveries('<><>')
      end
    end

    context 'when there are multiple deliverers' do
      it 'splits the deliveries between deliverers' do
        multiple_controller.deliverers[0] = mock_deliverer
        multiple_controller.deliverers[1] = mock_deliverer_2

        expect(mock_deliverer).to receive(:move).exactly(3).times
        expect(mock_deliverer_2).to receive(:move).exactly(3).times

        multiple_controller.process_deliveries('<><><>')
      end
    end
  end
end
