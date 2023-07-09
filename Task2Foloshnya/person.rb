# frozen_string_literal: true

require_relative 'erors'
require_relative 'console_input'
require_relative 'validation'

class Person

  attr_accessor :first_name, :last_name, :id, :birth_date

  def initialize(first_name, last_name, id, birth_date)
    @first_name = first_name
    @last_name = last_name
    @id = id
    @birth_date = birth_date
  end

end
