# UI methods handle all input and output
# so that CLI I/O can be tested.
class UI
  def give(output_message, stdout = $stdout)
    stdout.puts output_message
  end

  def receive(stdin = $stdin)
    stdin.gets.chomp
  end
end
