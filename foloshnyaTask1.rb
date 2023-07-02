require 'date'

module Validation
  MAX_NAME_LENGTH = 40
  NAME_REGEX = /((([A-Z][a-z]{2,})(-[A-Z][a-z]+)?)|(([А-ЯІЇЄ][а-яіїє]{2,})(-[А-ЯІЇЄ][а-яіїє]+)?))/
  INN_REGEX = /[A-Z]{2}\d{10}/

  def self.valid_name?(string)
    return false if string.nil? || string.empty? || string.length > MAX_NAME_LENGTH
    return string.match?(NAME_REGEX)
  end

  def self.valid_inn?(string)
    return false if string.nil? || string.empty?
    return false unless string.match?(INN_REGEX)
    true
  end

 def self.after_date?(date)
    return false if date.nil?
    date < Date.today
end

  
end

puts "Перший метод"

name = "Maria"
puts "#{name} #{Validation.valid_name?(name)}" # Очікуваний вивід : true

name = "Maria-Anna"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : true

name = "Анна-Марія"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : true

name = "Maria-knna"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : false

name = "maria"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : false

name = "An-"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : false

name = "AnnA"
puts "#{name} #{Validation.valid_name?(name)}" # Вивід : false

puts "Другий метод"

inn = "AZ1234543456"
puts ("#{inn} #{Validation.valid_inn?(inn)}") # Вивід : true

inn = "AZZ333"
puts ("#{inn} #{Validation.valid_inn?(inn)}") # Вивід : false

puts "Третій метод"

date_inn = Date.new(2003, 6, 19)
puts ("#{date_inn} #{Validation.after_date?(date_inn)}") # Вивід : true

date_inn = Date.new(2024, 6, 19)
puts ("#{date_inn} #{Validation.after_date?(date_inn)}") # Вивід : false
