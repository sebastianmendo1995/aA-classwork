require_relative "list.rb"
require_relative "item.rb"

class TodoBoard

    #def initialize(label)
    #    @list = List.new(label)
    #end
    def initialize
        @list = {}
    end

    def get_command
        puts "Enter a command"
        cmd, list_name, *args = gets.chomp.split(' ')

        case cmd
        when 'mklist'
            @list[list_name] = List.new(list_name)
        when 'ls'
            puts @list.keys
        when 'showall'
            @list.values.each {|list_obj| list_obj.print}
        when 'mktodo'
            @list[list_name].add_item(*args)
        when 'up'
            args.map!(&:to_i)
            @list[list_name].up(*args)
        when 'down'
            args.map!(&:to_i)
            @list[list_name].down(*args)
        when 'swap'
            args.map!(&:to_i)
            @list[list_name].swap(*args)
        when 'sort'
            @list[list_name].sort_by_date!
        when 'priority'
            @list[list_name].print_priority
        when 'print'
            if args.empty?
                @list[list_name].print
            else
                args.map!(&:to_i)
                @list[list_name].print_full_item(*args)
            end
        when 'toggle'
            args.map!(&:to_i)
            @list[list_name].toggle_item(*args)
        when 'rm'
            args.map!(&:to_i)
            @list[list_name].remove_item(*args)
        when 'purge'
            @list[list_name].purge
        when 'quit'
            return false
        else
            puts "Sorry, that command is not recognized."
        end
        true
    end


    def run
        while self.get_command
        end
    end
end

board = TodoBoard.new
board.run