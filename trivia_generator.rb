require "httparty"
require "htmlentities"
require "colorize"
require "json"
require "terminal-table"
require_relative "./presenter"
require_relative "./requester"
require_relative "./custom"

class TriviaGenerator
  include Presenter
  include Requester

  def initialize(filename = "scores.json")
    @coder = HTMLEntities.new
    @filename = filename
    File.open(@filename, "w") unless File.exist?(@filename)
    @scores = File.read(@filename).empty? ? [] : JSON.parse(File.read(@filename), symbolize_names: true)
  end

  def start
    action = ""
    until action == "exit"
      puts say_welcome
      action = select_main_menu
      case action
      when "random" then random_trivia
      when "custom" then custom
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
    @scores << new_score
    File.open(@filename, "w") { |file| file.write @scores.to_json }
  end

  def load_questions
    parse_questions(HTTParty.get("https://opentdb.com/api.php?amount=10"))
  end

  def parse_questions(response)
    JSON.parse(response.body, symbolize_names: true) if response.body
  end

  def print_scores
    puts scores_table(order_first)
  end

  def order_first
    top_to_bottom = @scores.sort { |x, y| y["points"] <=> x["points"] }
    top_to_bottom.map do |score|
      [score[:name], score[:points]]
    end
  end
end
