require 'date'
require_relative './generator'

class Enigma
  include Generator

  attr_reader :characters

   def initialize
     @characters = ('a'..'z').to_a << ' '
   end

  def encrypt(string, key = key_maker, date = Date.today, encryption = true)  #encrypts the returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.
    secret_message = []
    secret_message = message_rotator(string, key, date, encryption)
    reattach_specials(secret_message, string)  && encrypt_return(secret_message, key, date)
  end

  def decrypt(string, key, date, encryption = false)# decrypts the text returns a hash with 3 key value/pairs decyption: string, key:  key, date: date.key_array = key_grabber(key)
    secret_message = []
    secret_message = message_rotator(string, key, date, encryption)
    reattach_specials(secret_message, string) && decrypt_return(secret_message, key, date)
  end
end
