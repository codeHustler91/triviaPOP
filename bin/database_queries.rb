#question is asked
#user gives response
#need to save question data, if right/wrong, and user

# dustin = User.create(name: "dustin", high_score: 30)
# fekade = User.create(name: "fekade", high_score: 29)
# kyle = User.create(name: "kyle", high_score: 15)
# #<Question:0x00007fc54e9436d8
# id: 59,
# category: "General Knowledge",
# difficulty: "medium",
# mult_or_boo: "multiple",
# question: "Whose greyscale face is on the kappa emoticon on Twitch?",
# correct_answer: "Josh DeSeno",
# incorrect_answers: "[\"Justin DeSeno\", \"John DeSeno\", \"Jimmy DeSeno\"]">,

def save_right_answer(meta_instance)
    meta_instance.update(right_or_wrong: "right")
end

def save_wrong_answer(meta_instance)
    meta_instance.update(right_or_wrong: "wrong")
end

def does_user_exist?(user_response)
    User.find_by name: "#{user_response}"
    #returns nil if no user found
end

def round_score
    Metadata.last(10).map do |meta|
        difficulty = meta.question.difficulty
        if meta.right_or_wrong == "right"
            case difficulty
            when "easy"
                1
            when "medium"
                3
            when "hard"
                5
            else 0
            end
        elsif meta.right_or_wrong == "wrong"
            0
        else 0
        end
    end.reduce(:+)
end

def update_high_score

end