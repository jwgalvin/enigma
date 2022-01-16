require 'simplecov'
SimpleCov.start
require 'pry'
require 'rspec'
require './lib/enigma'
require './lib/generator'


describe do Enigma
  it 'exists' do
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")
    expect(enigma).to be_a(Enigma)
  end

  it "will test a random key generator" do
    enigma = Enigma.new
    key = Range.new(1, 5)
    expect(enigma.key_maker).to be_a(String)
    expect(enigma.key_maker.length).to eq(5)
  end

  it 'will test the character map' do
    enigma = Enigma.new
    expect(enigma.characters).to eq(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "])
  end

  it "will test that rotation does as expected" do
    enigma = Enigma.new
    expect(enigma.rotation('c')).to eq(["c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " ", "a", "b" ])
  end

  it "will remove specials" do
    enigma = Enigma.new
    expect(enigma.remove_specials("$#ME!@{[*]")).to eq(["m", "e"])
  end

  it 'will test offset here, manual input now' do
    enigma = Enigma.new
    expect(enigma.offset_grabber("040895")).to eq("1025")
    #this will change every day!
    # expect(enigma.offset_grabber).to be([4, 8, 8, 4])
  end

  it 'will test shifter; manual input' do
    enigma = Enigma.new
    expect(enigma.shifter("02715", "1025").values).to eq([3, 27, 73, 20])
    expect(enigma.shifter("02715","1025")).to eq({"A"=>3, "B"=>27, "C"=>73, "D"=>20}) #this tests keys and values
  end

  it "will encrypt things" do
    enigma = Enigma.new
    expect(enigma.encrypt("HELLO WORLD", "02715", "040895")).to eq({:encryption => "keder ohulw", :key => "02715", :date => "040895"})
    #this test is for randomized key and offset.
    #expect(enigma.encrypt("HELLO WORLD")).to eq({encryption key})
  end

  it "will decrypt things" do
    enigma = Enigma.new
    expect(enigma.decrypt("keder ohulw", "02715", "040895")).to eq({:encryption => "hello world", :key => "02715", :date => "040895"})
  end

  it "tests the date stripper" do
    enigma = Enigma.new
    test_date1 = Date.new(1995,8,4)
    test_date2 = "040895"
    expect(enigma.date_stripper(test_date1)).to eq("040895")
    expect(enigma.date_stripper(test_date2)).to eq("040895")
  end

  it "will test decrypted hash" do
    enigma = Enigma.new
    expect(enigma.decrypt_hash(["k","e","d","e","r", " ", "o", "h", "u", "l", "w"], "02715", "040895")).to eq({ :date => "040895", :decrypted => "keder ohulw", :key => "02715" })
  end

  it "will test encrypted hash" do
    enigma = Enigma.new
    expect(enigma.encrypt_return(["k","e","d","e","r", " ", "o", "h", "u", "l", "w"], "02715", "040895")).to eq({ :date => "040895", :encryption => "keder ohulw", :key => "02715" })
  end

end
