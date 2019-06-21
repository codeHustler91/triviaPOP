
def main_menu(user)
    puts "TriviaPOP Time!\nEasy questions are worth 3 point\nMedium questions are worth 5 points\nLets Play!? y/n"
        @user_response = gets.chomp
    if @user_response == "y"
        puts "Yay, lets get started!"
        prompt_question(user)
        # display first question.....get_and_parse
        #@parshed_hash
    else @user_response == "n" 
        puts `clear`
        puts "Awww Okay :(  Maybe Next Time"
        quits
    end
    #add method to look up stats on user
end

def prompt_question(user)
    random_question = Question.all.sample
    meta = Metadata.create(user: user, question: random_question, right_or_wrong: "not answered yet")
    puts "#{random_question.question}"
    get_user_answer(user, random_question, meta)
end

@@counter = 0

def get_user_answer(user, random_question, meta)
    while @@counter < 10
        give_answer_choices(random_question)
        answer = random_question.correct_answer
        puts "Enter the number corresponding to the correct answer"
        user_answer = gets.chomp
        if @shuffled_hash[user_answer.to_i] == answer
            puts "good job"
            @@counter += 1
            save_right_answer(meta)
            prompt_question(user) unless @@counter > 9
        elsif @shuffled_hash[user_answer.to_i] != answer
            puts "wrong answer, donkey brain"
            puts "The correct answer is #{answer}"
            @@counter += 1
            save_wrong_answer(meta)
            prompt_question(user) unless @@counter > 9
        elsif "q" == user_answer
            quits
        else
            puts "what happened?"
            quits
        end
    end
    end_of_round(user)
end

def give_answer_choices(random_question)
    answer = random_question.correct_answer
    wrong_answers = random_question.incorrect_answers
    split_wrong = wrong_answers.split("\"")
    wrong_right_string = "#{split_wrong[1]} + #{split_wrong[3]} + #{split_wrong[5]} + #{answer}"
    shuffle_and_format(wrong_right_string)
end

#add method for dealing with T/F questions

def shuffle_and_format(wrong_right_string)
    answer_array = wrong_right_string.split(" + ")
    shuffled = answer_array.shuffle
    @shuffled_hash = {}
    counter = 1
    shuffled.map do |answer|
        puts "#{counter} #{answer}"
        @shuffled_hash[counter] = answer
        counter += 1
    end
    #add method to replace funky '  ex. Wendy&#039;s ==> Wendy's
    # answer_array.map do |answer|
    #     if answer.include?("&#039;")
    #         answer.split("&#039;")
    #     else answer
    #     end
    # end
end