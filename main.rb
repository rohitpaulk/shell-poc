def listen_for_input
  $stdout.write("> ")
  cmd = gets.chomp

  if cmd == "exit"
    puts "bye"
  else
    puts "Invalid command. Try again."
    listen_for_input
  end
end

listen_for_input