module Presenter
  def say_welcome
    say_hi = ["###################################",
              "#   Welcome to Trivia Generator   #",
              "###################################"]
    say_hi.join("\n")
  end

  def print_score(score)
    # print the score message
    puts "Well done! Your score is #{score}"
  end

  def scores_table(scores)
    table = Terminal::Table.new
    table.title = "Top Scores"
    table.headings = %w[Name Score]
    table.rows = scores.select.each_with_index { |_, i| i < 5 }
    table
  end
end
