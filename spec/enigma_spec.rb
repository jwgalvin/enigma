require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/enigma'
require './lib/key_shifter'


describe do Enigma
  it 'exists' do
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    expect(enigma).to be_a(Enigma)
  end

  it 'will test the character map' do
    enigma = Enigma.new
    expect(enigma.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
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
    # expect(enigma.offset_grabber).to be("13  1  22")
  end
end
