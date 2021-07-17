module Bonus
  def validation_category
    puts "select a category id (between 9 and 32)"
    print "> "
    category = gets.chomp.to_i
    until (9..32).include? category
      puts "Invalid category"
      print "> "
      category = gets.chomp.to_i
    end
    category
  end

  def validation_difficulty
    puts "select a difficulty (easy, medium or hard)"
    print "> "
    difficulty = gets.chomp.downcase
    until %w[easy medium hard].include? difficulty
      puts "Invalid difficulty"
      print "> "
      difficulty = gets.chomp.downcase
    end
    difficulty
  end
end
