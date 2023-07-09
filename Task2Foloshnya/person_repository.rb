# frozen_string_literal: true
require_relative 'person'
require_relative 'erors'
require 'date'

class PersonRepository

  MIN_DATE = "1-01-01"
  MAX_DATE = Date.today

  def initialize
   @persons = []
  end

  def add(person)
    if person.is_a?(Person)
      if personAlreadyExist(person)
        return raise PersonAlreadyExistsError.new(person.id)
      end
        @persons << person
      end
  end

  def getAll
    @persons
  end

  def deleteById(id)
    @persons.delete(getById(id))
  end

  def editById(id, new_first_name, new_last_name, new_birth_date)
    editperson = getById(id)

    editperson.first_name = new_first_name
    editperson.last_name = new_last_name
    editperson.birth_date = new_birth_date
  end

  def getById(id)
    @persons.find { |person| person.id == id}
  end

  def getByPartName(part_name)
    part_name = part_name.downcase

    @persons.select do |person| person.first_name.downcase.include?(part_name) ||
      person.last_name.downcase.include?(part_name)
    end
  end

  def getByDateRange(from_date = nil,to_date = nil)

    if from_date.nil?
      from_date = MIN_DATE
    end
    if to_date.nil?
      to_date = MAX_DATE
    end

    @persons.select { |person| person.birth_date >= from_date && person.birth_date <= to_date}
  end

  private

  def personAlreadyExist(person)
    personalreadtexist = @persons.find { |foundperson| foundperson.id == person.id }
    return personalreadtexist
  end

  end


