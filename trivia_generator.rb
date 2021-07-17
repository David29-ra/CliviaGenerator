require "httparty"
require "htmlentities"
require "colorize"
require "json"
require "terminal-table"
require_relative "./presenter"
require_relative "./requester"

class TriviaGenerator
  include Presenter
  include Requester

  def initialize(filename = "score.json")
    @coder = HTMLEntities.new
    @filename = filename
    @scores = File.read(@filename).empty? ? [] : JSON.parse(File.read(@filename))
  end

  def start
    action = ""
    until action == "exit"
      puts say_welcome
      action = select_main_menu
      case action
      when "random" then random_trivia
      when "scores" then print_scores
      end
    end
    puts "Bye"
  end

  def random_trivia
    @score = 0
    @questions = load_questions[:results]
    print "\n"
    ask_questions
  end

  def ask_questions
    @questions.each do |question|
      @score = ask_question(question, @score, @coder)
    end
    @name = will_save?(@score * 10)
    save
  end

  def save
    new_score = { name: @name, points: @score * 10 }
    p new_score[:name]
    @scores << new_score
    File.open(@filename, "w") { |file| file.write @top.to_json }
  end

  def parse_scores
    # @scores = File.read(@filename).empty? ? [] : JSON.parse(File.read(@filename))
  end

  def load_questions
    parse_questions(HTTParty.get("https://opentdb.com/api.php?amount=3"))
  end

  def parse_questions(response)
    JSON.parse(response.body, symbolize_names: true) if response.body
  end

  def print_scores
    puts "print the scores sorted from top to bottom"
    p @scores.class
    puts scores_table(top_scores)
  end

  # def top_scores
  #   @scores.sort { |x, y| y[:points] <=> x[:points] }
  # end
end
