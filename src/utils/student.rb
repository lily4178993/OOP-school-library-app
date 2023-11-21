class Student < Person
  attr_reader :classroom

  def initialize(age, classroom, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    print '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end

  def to_s
    "[Student] Name: #{name}, ID: #{id}, Age: #{age}"
  end
end
