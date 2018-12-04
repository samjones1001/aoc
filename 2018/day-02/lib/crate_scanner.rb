class CrateScanner
  attr_reader :double_count, :triple_count

  def initialize
    @double_count = 0
    @triple_count = 0
  end

  def generate_checksum(input)
    input.split("\n").each do |barcode|
      @double_count += 1 if has_double_letter?(barcode)
      @triple_count += 1 if has_triple_letter?(barcode)
    end
    double_count * triple_count
  end

  def has_double_letter?(barcode)
    get_letter_counts(barcode).has_value?(2)
  end

  def has_triple_letter?(barcode)
    get_letter_counts(barcode).has_value?(3)
  end

  private
  def get_letter_counts(barcode)
    letter_counts = barcode.each_char.with_object(Hash.new(0)) do |char, hash|
      hash[char] += 1
    end
  end
end
