require_relative './key_shifter'

class Enigma
  include Key_Shifter

  def initialize

  end

  def encrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    # check_key_length(key)
    key_array = key_grabber(key)
    offset_array = offset_grabber(date)

  end

  def decrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
  end

  def char_map
    set = characters
    # binding.pry
    return set
  end
end
