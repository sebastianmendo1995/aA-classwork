require_relative "code"

class Mastermind
    def initialize(len)
        @secret_code = Code.random(len)
    end

    def print_matches(guess_obj)
        puts @secret_code.num_exact_matches(guess_obj)
        puts @secret_code.num_near_matches(guess_obj)
    end

    def ask_user_for_guess
        p 'Enter a code'
        guess = gets.chomp
        g1 = Code.from_string(guess)
        self.print_matches(g1)
        # @secret_code.==(g1)
        @secret_code == g1
    end

end
