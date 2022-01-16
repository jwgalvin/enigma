require './lib/enigma'

enigma = Enigma.new
encrypted = ARGV[0]
unencrypted = ARGV[1]
key = ARGV[2]
date = ARGV[3]
encrypted_message = File.read(encrypted, chomp:true)

File.open(unencrypted, "w") do |file|
  encrypt_message = enigma.decrypt(encrypted_message.strip, key, date)
  file.puts encrypt_message[:decryption]
    puts "Created '#{unencrypted}' with the key #{key} and date #{date} ."
end
