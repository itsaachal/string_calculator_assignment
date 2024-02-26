class StringCalculator

  def add(string)
    return 0 if string.empty?

    numbers = string.split(/\/\/|[,;\n]/).map(&:to_i)

    handle_negative_numbers(numbers) # to check for negative numbers and raise an exception if any
    # Return the sum of the numbers
    numbers.sum
  end

  private

  def handle_negative_numbers(numbers)
    negatives = numbers.select { |num| num.negative? }
    # Raise an exception with a message if negative numbers are found
    raise ArgumentError, "Negatives not allowed: #{negatives.join(',')}" if negatives.any?
  end

end

calculator = StringCalculator.new
input_string = "10,\n20\n30,1"
begin
  result = calculator.add(input_string)
  puts result
rescue ArgumentError => e
  puts "Error: #{e.message}"
end