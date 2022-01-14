# possible requires up here
module Key_Shifter

  def adjust(key)
    # check_key_length(key)
    # binding.pry

  end

  def key_grabber(key)
    key_array = key.chars
    new_key_array = []
    new_key_array << key_array[0] + key_array[1]
    new_key_array << key_array[1] + key_array[2]
    new_key_array << key_array[2] + key_array[3]
    new_key_array << key_array[3] + key_array[4]
  end


end
