$company = []


class Employee
    
  attr_reader :boss, :name, :salary
  def initialize(name, title, salary, boss)
    $company << self
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def direct_reports
    []
  end

  def bonus(multiplier)
    @salary * multiplier
  end
end

class Manager < Employee 
  def initialize(name, title, salary, boss)
    super

  end

  def direct_reports
      
    direct_reports = []
    $company.each do |employee|
      direct_reports << employee if employee.boss == self
    end
    direct_reports
  end

  def bonus(multiplier)
    total_salary = 0
    counted = []
    get_sub_employees.each do |sub|
        p sub.name
        p total_salary
      total_salary += sub.salary unless counted.include?(sub)
      counted << sub
    end
    total_salary * multiplier
  end

  def get_sub_employees
      
    sub_employees = self.direct_reports
    sub_employees.each do |sub_employee|
      sub_employees += sub_employee.direct_reports
    end
    sub_employees
  end
end



ned = Manager.new("Ned", "Manager", 1000000, nil)


darren = Manager.new("Darren", "Manager", 780000, ned)

shawna = Employee.new("Shawna", "Employee", 12000, darren)

david = Employee.new("David", "Employee", 10000, darren)

puts ned.get_sub_employees
puts "----------"

p ned.bonus(5) # => 500_000
p darren.bonus(4) # => 88_000
p david.bonus(3) # => 30_000
