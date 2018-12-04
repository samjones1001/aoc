require 'crate_scanner'

describe CrateScanner do
  describe '#generate_checksum' do
    it 'returns 0 if passed strings are invalid' do
      expect(subject.generate_checksum('abcdef')).to eq(0)
    end

    it 'increments the double count if passed a string with a double letter' do
      subject.generate_checksum('aabcdef')
      expect(subject.double_count).to eq(1)
    end

    it 'increments the triple count if passed a string with a triple letter' do
      subject.generate_checksum('aaabcdef')
      expect(subject.triple_count).to eq(1)
    end

    it 'returns the product of the number of barcodes with double letters and the number with triple letters' do
      input = "aabcdef\naabbbc\nabbbc\nabccc"
      expect(subject.generate_checksum(input)).to eq(6)
    end
  end

  describe '#has_double_letter?' do
    it 'returns false if passed a string with no double letters' do
      expect(subject.has_double_letter?('abcdefg')).to eq(false)
    end

    it 'returns true if passed a string with a double letter' do
      expect(subject.has_double_letter?('aabcdef')).to eq(true)
    end

    it 'returns false if only repeated letter appears more than twice' do
      expect(subject.has_double_letter?('aaaaabcdefg')).to eq(false)
    end
  end

  describe '#has_triple_letter?' do
    it 'returns false if passed a string with no double letters' do
      expect(subject.has_triple_letter?('aabcdefg')).to eq(false)
    end

    it 'returns true if passed a string with a double letter' do
      expect(subject.has_triple_letter?('aaabcdef')).to eq(true)
    end

    it 'returns false if only repeated letter appears more than twice' do
      expect(subject.has_triple_letter?('aaaaabcdefg')).to eq(false)
    end
  end
end
