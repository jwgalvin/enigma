require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/enigma'
require './lib/generator'
require './lib/encrypter'


describe do Enigma
  it 'exists' do
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    expect(enigma).to be_a(Enigma)
  end

  

  it 'will test keys here, manual input now' do
    enigma = Enigma.new
    expect(enigma.key_grabber("02715")).to eq(["02","27","71", "15"])
    # expect(enigma.shift)
  end

  it 'will test offset here, manual input now' do
    enigma = Enigma.new
    expect(enigma.offset_grabber("040895")).to eq([1, 0, 2, 5])
    #this will change every day!
    # expect(enigma.offset_grabber).to be([4, 8, 8, 4])
  end

  it 'will test shifter here, manual input' do
    enigma = Enigma.new
    expect(enigma.shifter(["02","27","71", "15"], [1, 0, 2, 5]).values).to eq([3, 27, 73, 20])
    expect(enigma.shifter(["02","27","71", "15"], [1, 0, 2, 5])).to eq({"A"=>3, "B"=>27, "C"=>73, "D"=>20})
  end
end
