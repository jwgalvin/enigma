require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/enigma'
require './lib/generator'
require './lib/encrypter'

describe do Rotater
  it 'will test the character map' do
    enigma = Enigma.new
    expect(enigma.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "will test that rotation does as expected"
    enigma = Enigma.new
    expect(enigma.rotation('c')).to eq(["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b" ])

end
