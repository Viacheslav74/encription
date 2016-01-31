#encoding: UTF-8
#Напишите программу, которая шифрует введённое пользователем слово одним
# из механизмов MD5 или SHA1:

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end
require 'digest' # предварительно установил библиотеку командой: gem install digest

puts "Введите слово или фразу для шифрования:"
word = gets.encode("UTF-8").chomp # фраза для шифрования

puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"

number = gets.encode("UTF-8").chomp # выбор пользователя 1 или 2

puts
puts "Вот что получилось:"

case number
  when '1'
    puts Digest::MD5.hexdigest word # код в кодировке MD5
  when '2'
    puts Digest::SHA1.hexdigest word # код в кодировке SHA1
  else
    puts "Недопустимая операция"
end




