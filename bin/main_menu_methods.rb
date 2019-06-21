
def main_menu(user)
    puts "TriviaPOP Time!\nEasy questions are worth 3 point\nMedium questions are worth 5 points\nLets Play!? y/n".bold
        @user_response = gets.chomp
    if @user_response == "y"
        puts "Yay, lets get started!".bold
        prompt_question(user)
        # display first question.....get_and_parse
        #@parshed_hash
    else @user_response == "n" 
        puts `clear`
        puts "Awww Okay :(  Maybe Next Time".bold
        quits
    end
    #add method to look up stats on user
end

def prompt_question(user)
    random_question = Question.all.sample
    meta = Metadata.create(user: user, question: random_question, right_or_wrong: "not answered yet")
    case @@counter 
    when 0 
        pic_question_1
    when 1
        pic_question_2
    when 2
        pic_question_3
    when 3
        pic_question_4
    when 4
        pic_question_5
    when 5
        pic_question_6
    when 6
        pic_question_7
    when 7
        pic_question_8
    when 8
        pic_question_9
    when 9
        pic_question_10
    end
    puts "#{random_question.question}".bold
    puts "\n"
    get_user_answer(user, random_question, meta)
end

@@counter = 0

def get_user_answer(user, random_question, meta)
    while @@counter < 10
        give_answer_choices(random_question)
        answer = random_question.correct_answer
        puts "\n"
        puts "Enter the number corresponding to the correct answer".bold
        user_answer = gets.chomp
        if @shuffled_hash[user_answer.to_i] == answer
            pic_correct_answer
            puts "Good Job!!".bold
            @@counter += 1
            save_right_answer(meta)
            prompt_question(user) unless @@counter > 9
        elsif @shuffled_hash[user_answer.to_i] != answer
            pic_incorrect_answer
            puts "Wrong Answer, Donkey Brain".bold
            puts "The Correct Answer is #{answer}".bold
            @@counter += 1
            save_wrong_answer(meta)
            prompt_question(user) unless @@counter > 9
        elsif "q" == user_answer
            quits
        else
            puts "What Happened?".bold
            pic_question_mark
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
        puts "#{counter} #{answer}".bold
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