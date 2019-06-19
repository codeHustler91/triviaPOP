require 'rest-client'
require 'pry'
require 'json'


def get_and_parse
    api_response = RestClient.get("https://opentdb.com/api.php?amount=10&category=9&difficulty=medium")
    JSON.parse(api_response)
end
    
# every time 'questions' is used, it runs another request to the api and produces another set of questions
def questions
    get_and_parse["results"]
end

## add method for saving to database
