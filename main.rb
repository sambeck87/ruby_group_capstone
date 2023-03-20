require_relative 'app'
require_relative 'utils'

def get_option_selected(from, to)
  option = ''
  loop do
    print "Select a valid option [#{from} ... #{to}]:?"
    option = gets.chomp.to_i
    break if option >= from && option <= to
  end

  option
end

def main
  app = App.new
  app.run
  puts 'Thanks for using this app!'
end

main
