require 'present_wrapper'

describe PresentWrapper do
  describe '#wrap_all_presents' do
    it 'returns the total wrapping required for a single present' do
      expect(subject.wrap_all_presents('1x2x3')).to eq(24)
    end

    it 'returns the total wrapping for multiple presents' do
      expect(subject.wrap_all_presents("1x2x3\n1x2x3")).to eq(48)
    end
  end

  describe '#ribbon_all_presents' do
    it 'returns the total ribbon for a single present' do
      expect(subject.ribbon_all_presents('2x3x4')).to eq(34)
    end

    it 'returns the total ribbon for a multiple presents' do
      expect(subject.ribbon_all_presents("2x3x4\n2x3x4")).to eq(68)
    end
  end

end
