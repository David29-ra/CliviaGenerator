module Requester
  def select_main_menu
    # prompt the user for the "random | scores | exit" actions
    gets_option(%w[random scores exit])
  end

  def ask_question(question, score, coder)
    puts "Category: #{question[:category]}  | Difficulty: #{question[:difficulty]}"
    puts coder.decode("Question: #{question[:question]}")
    mix = (question[:incorrect_answers] << question[:correct_answer]).shuffle
    mix.each_with_index { |x, y| puts "#{y + 1}. #{coder.decode(x)}" }
    puts "(#{question[:correct_answer]})"
    print "> "
    correct_or_incorrect(question, mix, score)
  end

  def will_save?(score)
    # show user's score
    # ask the user to save the score
    # grab user input
    # prompt the user to give the score a name if there is no name given, set it as Anonymous
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

  def correct_or_incorrect(question, mix, score)
    answer = gets.chomp.to_i
    if question[:correct_answer].strip == mix[answer - 1]
      puts "Well Done\n\n"
      score += 1
    else
      puts "#{mix[answer - 1]}...Incorrect"
      puts "Burrazo"
      puts "The correct answer was: #{question[:correct_answer]}\n\n"
    end
    score
  end
end
