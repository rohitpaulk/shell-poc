loop do
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")

  case command
  when "exit"
    break
  when "echo"
    puts args.join(" ")
  else
    puts "#{command}: command not found"
  end
end
