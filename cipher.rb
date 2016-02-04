class Cipher
  def initialize(input, shift)
    validate_inputs(input, shift)
    @input = input.downcase
    @alphabet = "abcdefghijklmnopqrstuvwxyz"
    @shifted_alphabet = @alphabet.chars.rotate(shift).join
  end

  def encrypt
    @input.tr(@alphabet, @shifted_alphabet)
  end

  private

  def validate_inputs(input, shift)
    unless input.is_a? String
      raise ArgumentError, "The input must be in string form."
    end

    unless shift.is_a? Integer
      raise ArgumentError, "The integer shift must be in integer form."
    end
  end
end
