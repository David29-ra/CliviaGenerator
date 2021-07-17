module Requester
  def select_main_menu
    gets_option(%w[random scores exit])
  end

  def ask_question(question, score, coder)
    puts "\rCategory: #{question[:category]}  | Difficulty: #{question[:difficulty]}"
    puts coder.decode("Question: #{question[:question]}")
    mix = (question[:incorrect_answers] << question[:correct_answer]).shuffle
    mix.each_with_index { |x, y| puts "#{y + 1}. #{coder.decode(x)}" }
    puts "(#{question[:correct_answer]})"
    print "> "
    correct_or_incorrect(question, mix, score, coder)
  end

  def will_save?(score)
    print_score(score)
    puts "-".cyan * 50
    save_action == "y" ? name = receive_name : start
    name.empty? ? "Anonymous" : name
  end

  def save_action
    action = ""
    until action.match?(/^[ny]$/)
      print "Do you want to save your score? y/n "
      action = gets.chomp.strip.downcase
    end
    action
  end

  def receive_name
    puts "Type the name to assign to the score"
    print "> "
    gets.chomp
  end

  def get_number(max: 100_000)
    # prompt the user for a number between 1 and the maximum number of options
  end

  def gets_option(options)
    puts options.join(" | ")
    print "> "
    input = gets.chomp.strip.downcase
    until options.include?(input)
      puts "Invalid option"
      print "> "
      input = gets.chomp.strip.downcase
    end
    input
  end

  def correct_or_incorrect(question, mix, score, coder)
    answer = gets.chomp.to_i
    if question[:correct_answer].strip == mix[answer - 1]
      puts "Well Done\n\n"
      score += 1
    else
      puts "#{mix[answer - 1]}... Incorrect!"
      puts "Burrazo"
      puts "The correct answer was: #{coder.decode(question[:correct_answer])}\n\n"
    end
    score
  end
end
