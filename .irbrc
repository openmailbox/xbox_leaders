begin
  require 'pry'
  binding.pry
rescue LoadError
  puts "Pry not found, using 'irb' instead."
ensure
  exit
end
