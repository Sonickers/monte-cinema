class Hall < ApplicationRecord
  def generate_seats
    row_count = seats / 10
    alphabet = ('A'..'Z').to_a

    rows = (1..row_count).map do |row|
      row_letter = alphabet[row - 1]
      (1..10).map { |column| "#{row_letter}#{column}" }
    end

    rows.flatten
  end
end
