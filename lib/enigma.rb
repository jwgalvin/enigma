require 'date'
require_relative './generator'

class Enigma
  include Generator

  attr_reader :characters

   def initialize
     @characters = ('a'..'z').to_a << ' '
   end

  def encrypt(string, key = key_maker, date = Date.today)  #encrypts the returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    shift = shifter(key, offset_grabber(date))
    secret_message = []
    remove_specials(string).each_with_index do |char, index|
      if index % 4 == 0
        secret_message << rotation(char).rotate(shift["A"])[0]
      elsif index % 4 == 1
        secret_message << rotation(char).rotate(shift["B"])[0]
      elsif index % 4 == 2
        secret_message << rotation(char).rotate(shift["C"])[0]
      else index % 4 == 2
        secret_message << rotation(char).rotate(shift["D"])[0]
      end
    end
    reattach_specials(secret_message, string)  && encrypt_return(secret_message, key, date)
  end

  def decrypt(string, key , date)# decrypts the text returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.key_array = key_grabber(key)
    shift = shifter(key, offset_grabber(date))
    secret_message = []
    #remove_specials(string)
    remove_specials(string).each_with_index do |char, index|
      if index % 4 == 0
        secret_message << rotation(char).rotate(-shift["A"])[0]
      elsif index % 4 == 1
        secret_message << rotation(char).rotate(-shift["B"])[0]
      elsif index % 4 == 2
        secret_message << rotation(char).rotate(-shift["C"])[0]
      else index % 4 == 3
        secret_message << rotation(char).rotate(-shift["D"])[0]
      end
    end
    reattach_specials(secret_message, string) && decrypt_return(secret_message, key, date)
  end
end
