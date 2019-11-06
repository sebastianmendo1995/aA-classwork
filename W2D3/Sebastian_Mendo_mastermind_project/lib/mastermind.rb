require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(code)
        p "This is the exact matches - #{@secret_code.num_exact_matches(code)}"

        p "This is the near matches - #{@secret_code.num_near_matches(code)}"
    end

    def ask_user_for_guess
        p "Enter a code"
        str = gets.chomp
        code = Code.from_string(str)
        print_matches(code)
        @secret_code == code
    end
    
end
