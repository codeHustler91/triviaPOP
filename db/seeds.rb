require 'rest-client'
Metadata.destroy_all
User.destroy_all
Question.destroy_all

#medium science: computers
medium_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=20&difficulty=medium&type=multiple")
parsed_med_gen = JSON.parse(medium_general_questions)

parsed_med_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

#hard science: computers
hard_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=20&difficulty=hard&type=multiple")
parsed_hard_gen = JSON.parse(hard_general_questions)

parsed_hard_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

#easy science: computers
easy_general_questions = RestClient.get("https://opentdb.com/api.php?amount=50&category=20&difficulty=easy&type=multiple")
parsed_easy_gen = JSON.parse(easy_general_questions)

parsed_easy_gen["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

