require 'item_checker'

describe ItemChecker do
  describe '#is_nice?' do
    it 'returns true when all conditions are met' do
      expect(ItemChecker.is_nice?('aaa')).to be(true)
    end

    it 'returns false if the string contains ab' do
      expect(ItemChecker.is_nice?('aaabc')).to be(false)
    end

    it 'returns false if the string contains cd' do
      expect(ItemChecker.is_nice?('eeebcd')).to be(false)
    end

    it 'returns false if the string contains pq' do
      expect(ItemChecker.is_nice?('ooopqr')).to be(false)
    end

    it 'returns false if the string contains xy' do
      expect(ItemChecker.is_nice?('aaaxyz')).to be(false)
    end

    it 'returns false if the string contains less than three vowels' do
      expect(ItemChecker.is_nice?('aexxyz')).to be(false)
    end

    it 'returns false if the string contains no double letters' do
      expect(ItemChecker.is_nice?('acaca')).to be(false)
    end
  end
end
