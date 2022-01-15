
module Generator  #This module contains the date_generator and the shifter/combination.

  def key_grabber(key)
    key_array = key.chars
    new_key_array = []
    new_key_array << key_array[0] + key_array[1]
    new_key_array << key_array[1] + key_array[2]
    new_key_array << key_array[2] + key_array[3]
    new_key_array << key_array[3] + key_array[4]
    return reduce_to_keys(new_key_array)
    # binding.pry
  end

  def reduce_to_keys(key_array)
    reduced_keys = []
    key_array.each do |key|
      key = key.to_i
      if key > 27
        key = key % 27
      end
      reduced_keys << key
    end
  end
  def offset_grabber(date = Date.today)
    if date.class == Date
      stripped_date = date.strftime("%-d, %-m, %-y").gsub(/,/, ' ')
    else
      offset_array = []
      offset = (date.to_i ** 2)
      offset_array = offset.to_s.chars.flat_map(&:to_i)
      while offset_array.length > 4
        offset_array.slice!(0)
      end
    end
    return offset_array
  end

  def shifter(key, offset)
    encrypt_hash = {
      "A" => (key[0].to_i + offset[0]),
      "B" => (key[1].to_i + offset[1]),
      "C" => (key[2].to_i + offset[2]),
      "D" => (key[3].to_i + offset[3])
      }
  end

end