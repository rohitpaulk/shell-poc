loop do
  $stdout.write("$ ")
  cmd = gets.chomp

  puts "#{cmd}: command not found"
end
