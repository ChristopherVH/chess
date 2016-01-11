class Employee
  attr_reader :salary , :boss

  def set_bos(boss)
    @boss = boss
    self.boss.subordinates << self unless self.boss.nil?
  end

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = nil
    self.set_bos(boss)
  end



  def bonus(multiplier)
    salary * multiplier
  end

end

class Manager < Employee
  attr_accessor :subordinates

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @subordinates = []
  end

  def bonus(multiplier)
    subordinate_salary * multiplier
  end

  def subordinate_salary
    sub_salary_total = 0
    subordinates.each do |sub|
      if sub.is_a?(Manager)
        sub_salary_total += sub.subordinate_salary + sub.salary
      else
        sub_salary_total += sub.salary
      end
    end

    sub_salary_total
  end
end
