
def main_menu(user)
    puts "TriviaPOP Time! Lets Play!? y/n"
        @user_response = gets.chomp
    if @user_response == "y"
        puts "Yay, lets get started!"
        prompt_question(user)
        # display first question.....get_and_parse
        #@parshed_hash
    else @user_response == "n" 
        puts `clear`
        puts "Awww Okay :(  Maybe Next Time"
    end
end

def prompt_question(user)
    random_question = Question.all.sample
    binding.pry
    Metadata.create(user: user, question: random_question)
    question = Question.find(@random_id).question
    puts "#{@question}"
    get_user_answer(user, answer)
end

def get_user_answer
    answer = Question.find(@random_id)
    @user_answer = gets.chomp
    binding.pry
end