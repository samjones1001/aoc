class ItemChecker
  MINIMUM_VOWELS = 3

  def self.is_nice?(string)
    return false if has_illegal_substring?(string)
    return false if vowel_count(string) < MINIMUM_VOWELS
    return false unless has_double_letters?(string)
    true
  end

  private_class_method
  def self.vowel_count(string)
    string.scan(/[aeiou]/).count
  end

  def self.has_double_letters?(string)
    string.split('').each_with_index { |char, i| return true if char == string[i + 1] }
    false
  end

  def self.has_illegal_substring?(string)
    illegals = ['ab', 'cd', 'pq', 'xy']
    string.match(Regexp.union(illegals))
  end
end
