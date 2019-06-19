def login
    puts "hello, welcome to TriviaPOP\n1. Are you a new user?\n2. Are you an existing user?\n(please enter number)"
    user_response = gets.chomp
    if user_response == "1"
        new_user
    elsif user_response == "2"
        find_user
    end
end

def new_user
    puts "Please enter your desired username"
    user_response = gets.chomp
    User.create(name: "#{user_response}", high_score: 0)
    main_menu
end

def find_user
    puts "Please enter your username"
    user_response = gets.chomp
    @profile = User.find_by name: "#{user_response}"
    binding.pry
    main_menu
end
