def locate_program(program)
  matching_path_entry = ENV["PATH"].split(":").detect do |path|
    full_path = File.join(path, program)

    File.executable?(full_path) ? full_path : nil
  end

  matching_path_entry ? File.join(matching_path_entry, program) : nil
end

def handle_command(command, args)
  case command
  when "exit"
    exit 0
  when "echo"
    puts args.join(" ")
  when "which"
    program_path = locate_program(args.first)
    puts program_path || "#{args.first} not found"
  else
    program_path = locate_program(command)
    if program_path
      Kernel.system(program_path, *args)
    else
      puts "#{command}: command not found"
    end
  end
end

loop do
  $stdout.write("$ ")
  command, *args = gets.chomp.split(" ")
  handle_command(command, args)
end
