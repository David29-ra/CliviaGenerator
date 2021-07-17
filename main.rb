require_relative "./trivia_generator"
# Start program

new_file = ARGV.shift

def file_extension?(new_file)
  return puts("---Enter an file valid---".red) unless new_file.nil? || (!new_file.nil? && new_file.match?("json"))

  true
end

return unless file_extension? new_file

trivia = TriviaGenerator.new(new_file.nil? ? "scores.json" : new_file)
trivia.start
