def login
    pic_trivia
    puts "          " # for spacing
    puts "Hello, Welcome to TriviaPOP\n1 New user?\n2 Existing user?\n(please enter number, or 'quit' to exit game)".bold
    user_response = gets.chomp
    if user_response == "1"
        new_user
    elsif user_response == "2"
        find_user
    elsif user_response == "quit"
        quits
    else puts "invalid input".bold
        login
        puts " "
    end
end

def new_user
    puts "Please enter your desired username".blink.red
    user_response = gets.chomp
    if does_user_exist?(user_response) == nil
        profile = User.create(name: "#{user_response}", high_score: 0)
        puts "Welcome #{user_response}".bold
        main_menu(profile)
    else 
        puts "Username already in use, try again".bold
        login
    end
end 

def find_user
    puts "Please enter your username".bold
    user_response = gets.chomp
    if does_user_exist?(user_response) == nil
        puts "User has not been created".bold
        login
    else 
        profile = User.find_by name: "#{user_response}"
        puts "Welcome #{user_response},  your High Score is #{profile.high_score}".bold
        main_menu(profile)
    end
end
