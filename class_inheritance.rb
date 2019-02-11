class Employee
    attr_reader :name, :title, :salary
    attr_accessor :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss = name, title, salary, boss 
    end 

    def bonus(multiplier)
        self.salary * multiplier
    end 
end

class Manager < Employee
    attr_accessor :employees 
    def initialize(name, title, salary, boss, employees)
        super(name, title, salary, boss)
        @employees = employees 
    end 

    def bonus(multiplier)
        #bonus salary of all employees
        #plus employee's employees
        #etc
        total_salaries = 0
        self.employees.each do |employee| 
            if employee.is_a?(Manager)
                total_salaries += employee.total_subord_salaries + employee.salary
            else  
                total_salaries += employee.salary 
            end 
        end 
        total_salaries * multiplier
    end

    def total_subord_salaries
        sum = 0
        self.employees.each do |subord|
            if subord.is_a?(Manager)
                sum += subord.total_subord_salaries
            else  
                sum += subord.salary 
            end
        end 
        sum 
    end 

end 
