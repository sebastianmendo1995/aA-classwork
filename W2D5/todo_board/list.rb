require_relative "item.rb"

class List

    attr_accessor :label

    def initialize(label)
        @items = []
        @label = label
    end

    def add_item(title, deadline, description = "" )
        if Item.valid_date?(deadline)
            @items << Item.new(title, deadline, description)
            return true
        else
            return false
        end
    end

    def size
        @items.length
    end

    def valid_index?(index)
        return false if index < 0 || index > @items.length-1
        true
    end

    def swap(index_1, index_2)
        if self.valid_index?(index_1) && self.valid_index?(index_2)
            @items[index_1], @items[index_2]= @items[index_2], @items[index_1]
            return true
        else
            return false
        end
    end

    def [](index)
        self.valid_index?(index) ? @items[index] : nil
    end

    def priority
        @items[0]
    end

    def print
        p "----------------------------------------------------"
        p @label.upcase.center(52)
        p "----------------------------------------------------"
        p "Index | Item                 | Deadline |   Done?"
        p "----------------------------------------------------"
        @items.each_with_index do |item,idx|
            p "#{idx.to_s.ljust(6)}| #{item.title.ljust(21)}| #{item.deadline} | #{item.done}"
        end
        p "----------------------------------------------------"
    end

    def print_full_item(index)
        if self.valid_index?(index)
            p '------------------------------------------'
            p "#{@items[index].title.ljust(31)}#{@items[index].deadline}"
            p "#{@items[index].description}"
            p "#{@items[index].done}"
            p '------------------------------------------'
        end
    end

    def print_priority
       self.print_full_item(0)
    end

    def up(index, amount=1)
        if self.valid_index?(index)
            amount.times do
                unless index == 0
                    self.swap(index-1,index)
                    index -= 1
                else
                    break
                end
            end
            return true
        else
            return false
        end
    end

    def down(index,amount=1)
        if self.valid_index?(index)
            amount.times do
                unless index == @items.length-1
                    self.swap(index+1,index)
                    index += 1
                else
                    break
                end
            end
            return true
        else
            return false
        end
    end

    def sort_by_date!
        @items.sort_by! {|item| item.deadline}
    end

    def toggle_item(index)
        @items[index].toggle
    end

    def remove_item(index)
        if self.valid_index?(index)
            @items.delete_at(index)
            return true
        else
            return false
        end
    end

    def purge
        purged = false
        while !purged
            purged = true
            (0...@items.length).each do |i|
                if @items[i].done
                    @items.delete_at(i)
                    purged = false
                    break
                end
            end
        end
    end

end