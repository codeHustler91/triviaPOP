api_response = RestClient.get("https://opentdb.com/api.php?amount=10&category=9&difficulty=medium")
parsed_api = JSON.parse(api_response)

parsed_api["results"].each do |question|
    Question.create(category: "#{question["category"]}", difficulty: "#{question["difficulty"]}", mult_or_boo: "#{question["type"]}", question: "#{question["question"]}", correct_answer: "#{question["correct_answer"]}", incorrect_answers: "#{question["incorrect_answers"]}")
end

