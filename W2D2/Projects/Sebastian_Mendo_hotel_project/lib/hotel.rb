require_relative "room"

class Hotel
    attr_reader :rooms
    def initialize(name, hash)
        @name=name
        @rooms=Hash.new(0)
        # room {
        #    room_name => Room.new(capacity)
        #}
        hash.each do |room,capacity| 
            @rooms[room] = Room.new(capacity)
        end
    end

    def name
        @name.split(" ").map {|word| word.capitalize}.join(" ")
    end

    def room_exists?(room_name)
        @rooms.keys.include?(room_name)
    end

    def check_in(person, name)
        if room_exists?(name)
            @rooms[name].add_occupant(person) ? (p 'check in successful') : (p 'sorry, room is full')
        else 
            p 'sorry, room does not exist'
        end
    end

    def has_vacancy?()
        @rooms.each { |room, class1| return true if class1.capacity - class1.occupants.length > 0}
        false
    end

    def list_rooms
        res=""
        @rooms.each do |room, class1|
             res+= "#{room} #{class1.available_space}\n"
        end
        puts res
    end
end