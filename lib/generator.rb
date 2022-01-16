
module Generator  #This module contains the date_generator and the shifter/combination.

  # def key_grabber(key)
  #   pairs = key.split("").map(&:to_i).each_cons(2).map {|num| num.join}
  # end

  # def reduce_to_keys(key_array) # reduces any key value over 27 the modulo
  #   reduced_keys = []
  #   key_array.each do |key|
  #     key = key.to_i
  #     if key > 27
  #       key = key % 27
  #     end
  #     reduced_keys << key
  #   end
  # end

  def offset_grabber(date = Date.today) #this converts the date into the offset
    if date.class == Date
      strip_date = date.strftime("%d,%m,%y").gsub(/,/,'')
      (strip_date.to_i ** 2).to_s.split("").last(4)
    else
      (date.to_i ** 2).to_s.split("").last(4)
    end.join
  end

  def date_stripper(date)
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
