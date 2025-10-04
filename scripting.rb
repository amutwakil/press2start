class Student
  attr_accessor :name
  attr_writer :grade

  def initialize(name:, grade:)
    @name = name
    @grade = grade
  end

  def grade_better_than?(opps_grade)
    opps_grade.grade > self.grade ? true : false
  end

  protected
  attr_reader :grade
end

