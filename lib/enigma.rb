require_relative './encrypter'
require_relative './generator'
class Enigma
  include Generator

  attr_reader :characters

  def initialize
    @characters = ('a'..'z').to_a << ' '
  end

  def encrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    # check_key_length(key)
    key_array = key_grabber(key)
    offset_array = offset_grabber(date)
    shift = shifter(key_array, offset_array)
  end

  def decrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
  end


end
