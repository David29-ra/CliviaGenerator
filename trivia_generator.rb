# do not forget to require your gem dependencies
require "httparty"
require "htmlentities"
# do not forget to require_relative your local dependencies
require_relative "./presenter"
require_relative "./requester"
class TriviaGenerator
  # maybe we need to include a couple of modules?
  include Presenter
  include Requester
  # include Httparty

  def initialize
    # we need to initialize a couple of properties here
    @coder = HTMLEntities.new
  end

  def start
    # welcome message
    puts say_welcome
    # prompt the user for an action
    action = ""
    # keep going until the user types exit
    until action == "exit"
      action = select_main_menu
      case action
      when "random" then random_trivia
      when "scores" then print_scores
      end
    end
    puts "Bye"
  end

  def random_trivia
    puts "load the questions from the api"
    questions = load_questions[:results]
    # pp questions
    ask_questions(questions)
    # questions are loaded, then let's ask them
  end

  def ask_questions(questions)
    # mix answer
    # ask each question
    # if response is correct, put a correct message and increase score
    # if response is incorrect, put an incorrect message, and which was the correct answer
    # once the questions end, show user's score and promp to save it
    questions.each do |question|
      ask_question(question)
    end
  end

  def save(data)
    # write to file the scores data
  end

  def parse_scores
    # get the scores data from file
  end

  def load_questions
    # ask the api for a random set of questions
    parse_questions(HTTParty.get("https://opentdb.com/api.php?amount=3"))
  end

  def parse_questions(response)
    # questions came with an unexpected structure, clean them to make it usable for our purposes
    # JSON.parse(response.body.gsub(/&quot;/, "'"), symbolize_names: true) if response.body
    JSON.parse(response.body, symbolize_names: true) if response.body
  end

  def print_scores
    puts "print the scores sorted from top to bottom"
  end
end

trivia = TriviaGenerator.new
trivia.start
