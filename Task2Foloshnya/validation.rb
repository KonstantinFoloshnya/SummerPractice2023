require 'date'

module Validation
    MAX_NAME_LENGTH = 40
    NAME_REGEX = /((([A-Z][a-z]{2,})(-[A-Z][a-z]+)?)|(([А-ЯІЇЄ][а-яіїє]{2,})(-[А-ЯІЇЄ][а-яіїє]+)?))/
    INN_REGEX = /[A-Z]{2}\d{10}/

    def valid_name?(string)
      return false if string.nil? || string.empty? || string.length > MAX_NAME_LENGTH
      return string.match?(NAME_REGEX)
    end

    def valid_inn?(string)
      return false if string.nil? || string.empty?
      return false unless string.match?(INN_REGEX)
      true
    end

   def after_date?(date)
      return false if date.nil?
      date < Date.today
   end

end
