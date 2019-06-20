require 'rest-client'
Metadata.destroy_all
User.destroy_all
Question.destroy_all

dustin = User.create(name: "dustin", high_score: 30)
fekade = User.create(name: "fekade", high_score: 29)
kyle = User.create(name: "kyle", high_score: 15)

#medium general knowledge
medium_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=9&difficulty=medium")
parsed_med_gen = JSON.parse(medium_general_questions)

parsed_med_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

#hard general knowledge
hard_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=9&difficulty=hard")
parsed_hard_gen = JSON.parse(hard_general_questions)

parsed_hard_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

#easy general knowledge
easy_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=9&difficulty=easy")
parsed_easy_gen = JSON.parse(easy_general_questions)

parsed_easy_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

