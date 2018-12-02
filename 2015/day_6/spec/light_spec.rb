require 'light'

describe Light do
  let (:light) { described_class.new(0,1) }

  it "knows it\'s own x position" do
    expect(light.x).to eq(0)
  end

  it "knows it\'s own y position" do
    expect(light.y).to eq(1)
  end

  it "is switched off a initialization" do
    expect(light.on?).to be(false)
  end

  context "when the light is off" do
    describe "#toggle" do
      it 'turns the light on' do
        light.toggle
        expect(light.on?).to be(true)
      end
    end

    describe "#switch_on" do
      it 'turns the light on' do
        light.switch_on
        expect(light.on?).to be(true)
      end
    end

    describe "#switch_off" do
      it 'does not affect the light' do
        light.switch_off
        expect(light.on?).to be(false)
      end
    end
  end

  context "when the light is on" do
    before(:each) do
      light.switch_on
    end

    describe "#toggle" do
      it 'turns the light off' do
        light.toggle
        expect(light.on?).to be(false)
      end
    end

    describe "#switch_on" do
      it 'does not affect the light' do
        light.switch_on
        expect(light.on?).to be(true)
      end
    end

    describe "#switch_off" do
      it 'switches the light off' do
        light.switch_off
        expect(light.on?).to be(false)
      end
    end
  end
end
