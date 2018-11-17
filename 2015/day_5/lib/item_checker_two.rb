class ItemCheckerTwo
  def self.is_nice?(string)
    return false unless has_repeated_pairs?(string)
    return false unless has_split_pair?(string)
    true
  end

  class << self
    private
    def has_split_pair?(string)
      string.split('').each_cons(3).any? { |a,b,c| a == c }
    end

    def has_repeated_pairs?(string)
      pairs = string.split('').map.with_index { |char, i| char + string[i+1] if string[i+1] }
      overlapping_pairs = pairs.each_cons(2).count { |a,b| a == b }
      (pairs.length - overlapping_pairs) != pairs.uniq.length
    end
  end
end
