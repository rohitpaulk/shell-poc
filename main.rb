def handle_command(command, args)
  case command
  when "exit"
    exit 0
  when "echo"
    puts args.join(" ")
  when "which"
    matching_path_entry = ENV["PATH"].split(":").detect do |path|
      full_path = File.join(path, args.first)

      File.executable?(full_path) ? full_path : nil
    end

    if matching_path_entry
      puts File.join(matching_path_entry, args.first)
    else
      puts "#{args.first} not found"
    end
  else
    puts "#{command}: command not found"
  end
end

loop do
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")
  handle_command(command, args)
end
