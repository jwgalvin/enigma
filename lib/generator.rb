
module Generator  #This module contains the date_generator and the shifter/combination.

  def key_grabber(key) # This converts the 5 digit key into 5- 2 digit numbers
    key_array = key.chars
    new_key_array = []
    new_key_array << key_array[0] + key_array[1]
    new_key_array << key_array[1] + key_array[2]
    new_key_array << key_array[2] + key_array[3]
    new_key_array << key_array[3] + key_array[4]
    reduce_to_keys(new_key_array)
    # binding.pry
  end

  def reduce_to_keys(key_array) # reduces any key value over 27 the modulo
    reduced_keys = []
    key_array.each do |key|
      key = key.to_i
      if key > 27
        key = key % 27
      end
      reduced_keys << key
    end
  end

  def offset_grabber(date) #this converts the date into the offset
    date_stripper(date)
    (date.to_i ** 2).to_s.split("").last(4).join
  end

  def shifter(key, offset) # This merges the shift and the offset.
    encrypt_hash = {
      "A" => (key[0].to_i + offset[0].to_i),
      "B" => (key[1].to_i + offset[1].to_i),
      "C" => (key[2].to_i + offset[2].to_i),
      "D" => (key[3].to_i + offset[3].to_i)
      }
  end

  def remove_specials(message) #this will remove spec characters and downcase the message.
    message.downcase.split('').find_all {|character| @characters.include?(character)}
  end

  def date_stripper(date)
    if date.class == Date
      date.strftime("%d,%m,%y").gsub(/,/,'')
    else
      date
    end
  end

  def encrypt_return(secret_message, key, date) # This helper formats the return
    encrypt_hash = {'encryption': secret_message.join, 'key': key, 'date': date_stripper(date)}
  end


  def decrypt_return(secret_message, key, date) # This helper formats the return
    decrypt_hash = {'encryption': secret_message.join, 'key': key, 'date': date_stripper(date)}
  end

  def key_maker
    rand(99999).to_s.rjust(5, '0')
  end

end
