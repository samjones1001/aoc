require 'item_checker_two'

describe ItemCheckerTwo do
  describe '#is_nine?' do
    it 'returns true if a string meets all requirements' do
      expect(ItemCheckerTwo.is_nice?('abab')).to be(true)
    end

    it 'returns false if a string contains no split paris' do
      expect(ItemCheckerTwo.is_nice?('abcab')).to be(false)
    end

    it 'returns false if there is not repeated pair' do
      expect(ItemCheckerTwo.is_nice?('abac')).to be(false)
    end

    it 'returns false if the only repeated pairs overlap' do
      expect(ItemCheckerTwo.is_nice?('aaaca')).to be(false)
    end
  end
end
