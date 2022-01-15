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

  def encrypt(string, key, date = Date.new)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    key_array = key_grabber(key)
    offset_array = offset_grabber(date)
    shift = shifter(key_array, offset_array)
    secret_message = []
    remove_specials(string).each_with_index do |char, index|
      if index % 4 == 0
        # binding.pry
        secret_message << rotation(char).rotate(shift["A"])[0]
      elsif index % 4 == 1
        secret_message << rotation(char).rotate(shift["B"])[0]
      elsif index % 4 == 2
        secret_message << rotation(char).rotate(shift["C"])[0]
      else index % 4 == 2
        secret_message << rotation(char).rotate(shift["D"])[0]
      end
    end
    encrypt_return(secret_message, key, date)

  end

  def decrypt(string, key, date)
    #returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
  end


end
