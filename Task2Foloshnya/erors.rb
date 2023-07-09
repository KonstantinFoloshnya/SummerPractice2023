# frozen_string_literal: true

class ObjectNotOfPersonTypeError < StandardError
  def initialize
    super("Person must be of type Person.Class")
  end
end

class PersonAlreadyExistsError < StandardError
  def initialize(id)
    super("Person with ID #{id} already exists.")
  end
end

class PersonNotFoundError < StandardError
  def initialize(id)
    super("Person with INN #{id} cannot be found.")
  end
end
