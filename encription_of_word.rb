#encoding: UTF-8
#Напишите программу, которая шифрует введённое пользователем слово одним
# из механизмов MD5 или SHA1:
#Добавьте программу из задачи 3–3 в репозиторий.
#Создайте дополнительную ветку c именем sha2
# и в этой ветке исправьте программу так, чтобы в качестве третьего метода
# можно было зашифровать фразу с помощью алгоритма SHA2.

if (Gem.win_platform?)
  Encoding.default_external = Encoding.find(Encoding.locale_charmap)
  Encoding.default_internal = __ENCODING__

  [STDIN, STDOUT].each do |io|
    io.set_encoding(Encoding.default_external, Encoding.default_internal)
  end
end

require 'digest' # предварительно установил библиотеку кодирования
# командой: gem install digest

puts "Введите слово или фразу для шифрования:"
word = gets.encode("UTF-8").chomp # фраза для шифрования

puts "Каким способом зашифровать:"
puts "1. MD5"
puts "2. SHA1"
puts "3. SHA2"

number = gets.encode("UTF-8").chomp # выбор пользователя 1, 2 или 3

puts
puts "Вот что получилось:"

case number
  when '1'
    puts Digest::MD5.hexdigest word # код в кодировке MD5
  when '2'
    puts Digest::SHA1.hexdigest word # код в кодировке SHA1
  when '3'
    puts Digest::SHA2.hexdigest word # код в кодировке SHA2
  else
    puts "Недопустимая операция"
end




