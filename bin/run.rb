require_relative '../config/environment'

def welcome
    puts "hello, welcome to TriviaPOP\n1. Are you a new user?\n2. Are you an existing user?\n(please enter number)"
    user_response = gets.chomp
    if user_response == "1"
        new_user
    elsif user_response == "2"
        find_user
    end
end

def new_user

end









welcome