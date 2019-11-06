class Employee
  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = salary * multiplier
  end

  attr_reader :salary
end

class Manager < Employee

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def bonus(multiplier)
    bonus = 0
    employees.each { |employee| bonus += employee.salary }
    bonus * multiplier
  end

  attr_reader :employees, :salary
  attr_writer :employees
end

ned = Manager.new("Ned", "Founder", 1000000, nil)
darren = Manager.new("Darren", "TA Manager", 78000, ned)
shawna = Employee.new("Shawna", "TA", 12000, darren)
david = Employee.new("David", "TA", 10000, darren)

ned.employees = [darren, shawna, david]
darren.employees= [shawna, david]

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000