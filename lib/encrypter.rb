require_relative './generator'

class Encrypter
  attr_reader :characters

  def initialize  #intializes with the character set
    @characters = ('a'..'z').to_a << ' '
  end

  def rotation(char) # this will rotate to the position argument
    @characters.rotate(@characters.index(char))
  end

end
