
module Generator  #This module contains the date_generator and the shifter/combination.

  def offset_grabber(date = Date.today) #this converts the date into the offset
    if date.class == Date
      strip_date = date.strftime("%d,%m,%y").gsub(/,/,'')
      (strip_date.to_i ** 2).to_s.split("").last(4)
    else
      (date.to_i ** 2).to_s.split("").last(4)
    end.join
  end

  def date_stripper(date) #gets a properly formated number from date for decrypt_return
    if date.class == Date
      strip_date = date.strftime("%d,%m,%y").gsub(/,/,'')
    else
      date
    end
  end

  def shifter(key = key_maker, offset) # This merges the shift and the offset.
    pairs = key.split("").map(&:to_i).each_cons(2).map {|num| num.join.to_i}
    # binding.pry
    encrypt_hash = {
      "A" => (pairs[0].to_i + offset[0].to_i),
      "B" => (pairs[1].to_i + offset[1].to_i),
      "C" => (pairs[2].to_i + offset[2].to_i),
      "D" => (pairs[3].to_i + offset[3].to_i)
      }
  end

  def remove_specials(message) #this will remove spec characters and downcase the message.
    message.downcase.split('').find_all {|character| @characters.include?(character)}
  end

  def special_syntax(message) # specials that are removed from message are pulled into and array with their index position.
    array = []
    message.downcase.split('').each_with_index do |char, index|
      if !characters.include?(char)
      array << (char + index.to_s).split
      end
    end
    array
  end

  def reattach_specials(secret, original)
    special_syntax(original).each do |char|
       secret.insert(char[0][1..-1].to_i, char[0][0])
    end
    secret.join
  end

  def encrypt_return(secret_message, key, date) # This helper formats the return
    encrypt_hash = {'encryption': secret_message.join, 'key': key, 'date': date_stripper(date)}
  end

  def decrypt_return(secret_message, key, date) # This helper formats the return
    decrypt_hash = {'decrypted': secret_message.join, 'key': key, 'date': date_stripper(date)}
  end

  def key_maker
    rand(99999).to_s.rjust(5, '0')
  end

  def rotation(char) # this will rotate to the position argument
    @characters.rotate(@characters.index(char))
  end
end
