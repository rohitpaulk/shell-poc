loop do
  $stdout.write("$ ")
  cmd = gets.chomp

  case cmd
  when "exit"
    break
  else
    puts "#{cmd}: command not found"
  end
end
