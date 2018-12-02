require 'frequency_calibrator'

describe FrequencyCalibrator do
  describe '#calculate_frequency' do
    it 'retruns the correct frequency, passed a string of numbers' do
      expect(subject.calculate_frequency("+1\n+5\n-2\n+1")).to eq(5)
    end
  end
end
