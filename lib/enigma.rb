require_relative './encrypter'
require_relative './generator'

class Enigma
  include Generator

  attr_reader :characters

   def initialize
     @characters = ('a'..'z').to_a << ' '
   end

  def rotation(char) # this will rotate to the position argument
    @characters.rotate(@characters.index(char))
  end

  def encrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    key_array = key_grabber(key)
    offset_array = offset_grabber(date)
    shift = shifter(key_array, offset_array)
    encrypt = []
      
    # check_key_length(key)
  end

  def decrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
  end


end
