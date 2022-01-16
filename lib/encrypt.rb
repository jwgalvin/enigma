require './lib/enigma'
enigma = Enigma.new

not_encrypted = ARGV[0]
encrypted = ARGV[1]

message_to_encrypt = File.read(not_encrypted, chomp:true)

File.open(encrypted, "w") do |file|
  encrypt_message = enigma.encrypt(message_to_encrypt)
  file.puts encrypt_message[:encryption]
    puts "Created '#{encrypted}' with the key #{encrypt_message[:key]} and date #{encrypt_message[:date]} ."
end
