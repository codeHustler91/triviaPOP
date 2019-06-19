def main_menu
    puts "TriviaPOP Time! Lets Play!? y/n"
        @user_response = gets.chomp
    if @user_response == "y"
        puts "Yay, lets get started!"
        # display first question.....get_and_parse
        #@parshed_hash
    else @user_response == "n" 
        puts `clear`
        puts "Awww Okay :(  Maybe Next Time"
    end
end