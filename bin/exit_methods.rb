def end_of_round(user)
    pic_gameover
    puts "End Of The Round, #{user.name}".bold
    puts "You Scored #{round_score} Points!".blink.red
    update_high_score
    puts "Would You Like To Play Again? y/n".bold
    user_response = gets.chomp
    if user_response == "y"
        @@counter = 0
        main_menu(user)
    elsif user_response == "n"
        quits
    else puts "Enter y/n".bold
        end_of_round(user)
    end
end

def quits
    puts "Goodbye Forever".bold
    exit!
end