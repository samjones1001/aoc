require 'frequency_calibrator'

describe FrequencyCalibrator do
  it 'initializes with a history of 0' do
    expect(subject.history).to eq([0])
  end

  describe '#process_instructions' do
    it 'returns the first frequency to appear twice in history' do
      expect(subject.process_instructions("+1\n-1")).to eq(0)
    end

    it 'loops over input until a repeat is located' do
      expect(subject.process_instructions("+1\n+1\n-3")).to eq(0)
    end
  end

  describe '#sum_of_frequencies' do
    it 'returns 0 if passed an empty string' do
      expect(subject.sum_of_frequencies("")).to eq(0)
    end

    it 'retruns the correct frequency, passed a string of numbers' do
      expect(subject.sum_of_frequencies("+1\n+5\n+2\n+1")).to eq(9)
    end

    it 'functions correctly when provided negative numbers' do
      expect(subject.sum_of_frequencies("+1\n+5\n-2\n+1")).to eq(5)
    end
  end
end
