require_relative 'utils'

def list_books
    p 'hello'
end

puts 'Please select an option:'
OPTIONS.each { |key, value| puts "#{key} - #{value[0]}" }

selected_option = gets.chomp.to_i
send((OPTIONS[selected_option][1]).to_s)
