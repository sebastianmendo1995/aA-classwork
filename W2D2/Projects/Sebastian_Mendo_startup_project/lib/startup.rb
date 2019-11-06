require_relative "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name,funding, salaries)
        @name=name
        @funding=funding
        @salaries=salaries
        @employees=[]
    end

    def valid_title?(title)
        @salaries.has_key?(title)
    end

    def >(startup)
        self.funding>startup.funding ? true : false
    end

    def hire(employee_name,title)
        if self.valid_title?(title)
            @employees<< Employee.new(employee_name,title)
        else
            raise "Error"
        end
    end

    def size
        @employees.length
    end
    #salaries {"title"=>pay}
    def pay_employee(employee)
        if @funding>@salaries[employee.title]
            @funding-=@salaries[employee.title]
            employee.pay(@salaries[employee.title])
        else
            raise "Error"
        end
    end

    def payday
        @employees.each { |employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        count = 0

        @employees.each do |employee|
            sum += @salaries[employee.title]
            count += 1
        end

        sum/count
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        other_startup.salaries.each do |title,pay|
            if !self.salaries.has_key?(title)
                self.salaries[title] = pay
            end
        end
        @funding += other_startup.funding
        @employees += other_startup.employees
        other_startup.close
    end
end




