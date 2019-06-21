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
                3
            when "medium"
                5
            when "hard"
                8
            else 0
            end
        elsif meta.right_or_wrong == "wrong"
            0
        else 0
        end
    end.reduce(:+)
end

def update_high_score
    if round_score > Metadata.last.user.high_score
        Metadata.last.user.update(high_score: round_score)
    end
end