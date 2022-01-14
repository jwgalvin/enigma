require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/enigma'
require './lib/key_shifter'

describe do Enigma
  it 'exists and takes arguments' do
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    expect(enigma).to be_a(Enigma)
    expect(enigma.key_grabber("02715")).to eq(["0","2","7","1","5"])
  end
end
