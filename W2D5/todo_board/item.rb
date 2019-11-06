class Item
    attr_accessor :title, :description
    attr_reader :deadline, :done

    def self.valid_date?(date_string)
        arr = date_string.split('-')
        # arr.map! {|i| i.to_i}
        arr.map!(&:to_i)
        return false if !(arr[1] <= 12 && arr[1] >= 1)
        return false if !(arr[2] <= 31 && arr[2] >= 1)
        true
    end

    def initialize(title, deadline, description)
        @title = title
        @description = description
        @done = false
        if Item.valid_date?(deadline)
            @deadline = deadline
        else
            raise "invalid deadline date"
        end
    end

    def deadline=(new_deadline)
        if Item.valid_date?(new_deadline)
            @deadline = new_deadline
        else
            raise "invalid deadline"
        end
    end

    def toggle
        @done ? @done = false : @done = true
    end

end