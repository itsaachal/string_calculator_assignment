class StringCalculator

  def add(string)
    return 0 if string.nil?

    numbers = string.split(/[,\n]/).map(&:to_i)
    negatives = numbers.select { |num| num.negative? }

    if negatives.any?
      raise ArgumentError, "Negatives not allowed: #{negatives.join(',')}"
    else
      numbers.sum
    end
  end

  calculator = StringCalculator.new
  input_string = "10,\n20\n30"
  p result = calculator.add(input_string)

end