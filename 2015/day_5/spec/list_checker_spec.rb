require 'list_checker'

describe ListChecker do
  let(:checker)   { described_class.new(mock_item) }
  let(:mock_item) { double(:item_checker) }

  describe '#nice_count' do
    it 'checks if a string is nice' do
      expect(mock_item).to receive(:is_nice?).with('abc')
      checker.nice_count('abc')
    end

    it 'can check multiple strings' do
      expect(mock_item).to receive(:is_nice?).exactly(3).times
      checker.nice_count("abc\nbcd\ncde")
    end

    it 'returns a count of the number of nice strings' do
      allow(mock_item).to receive(:is_nice?).and_return(true)
      expect(checker.nice_count("abc\nbcd\ncde")).to eq(3)
    end
  end
end
