def end_of_round(user)
    puts "End of the round, #{user.name}"
    puts "you scored #{round_score} points!"
    update_high_score
    puts "would you like to play again? y/n"
    user_response = gets.chomp
    if user_response == "y"
        @@counter = 0
        main_menu(user)
    elsif user_response == "n"
        quits
    else puts "enter y/n"
        end_of_round(user)
    end
end

def quits
    puts "goodbye"
    exit!
end