def login
    puts "hello, welcome to TriviaPOP\n1 New user?\n2 Existing user?\n(please enter number, or 'quit' to exit game)"
    user_response = gets.chomp
    if user_response == "1"
        new_user
    elsif user_response == "2"
        find_user
    elsif user_response == "quit"
        quits
    else puts "invalid input"
        login
        puts " "
    end
end

def new_user
    puts "Please enter your desired username"
    user_response = gets.chomp
    if does_user_exist?(user_response) == nil
        profile = User.create(name: "#{user_response}", high_score: 0)
        puts "Welcome #{user_response}"
        main_menu(profile)
    else 
        puts "username already in use, try again"
        login
    end
end 

def find_user
    puts "Please enter your username"
    user_response = gets.chomp
    if does_user_exist?(user_response) == nil
        puts "user has not been created"
        login
    else 
        profile = User.find_by name: "#{user_response}"
        puts "Welcome #{user_response},  your High Score is #{profile.high_score}"
        main_menu(profile)
    end
end
