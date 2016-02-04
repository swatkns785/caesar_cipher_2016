require 'rspec'
require_relative './cipher.rb'

RSpec.describe "#encrypt" do
  it "shifts letters by a fixed number" do
    cipher = Cipher.new("abc", 3)
    expect(cipher.encrypt).to eq("def")
  end

  it "shifts letters in reverse when a negative shift is provided" do
    cipher = Cipher.new("abc", -3)
    expect(cipher.encrypt).to eq("xyz")
  end

  it "keeps punctuation, spaces, and numbers in the same place as the original input" do
    cipher = Cipher.new("a b ; c 5", 3)
    expect(cipher.encrypt).to eq("d e ; f 5")
  end
end

RSpec.describe "#validate_inputs" do

  input_error = "The input must be in string form."
  shift_error = "The integer shift must be in integer form."

  it "accepts strings as the input" do
    expect { Cipher.new("this is a string", 3) }.to_not raise_error
  end

  it "does not accept integers as the input" do
    expect { Cipher.new(321, 3) }.to raise_error(input_error)
  end

  it "does not accept floats as the input" do
    expect { Cipher.new(3.5, 3) }.to raise_error(input_error)
  end

  it "does not accept nil as the input" do
    expect { Cipher.new(nil, 3) }.to raise_error(input_error)
  end

  it "accepts integers as the shift" do
    expect { Cipher.new("put an integer in the shift", 3) }.to_not raise_error
  end

  it "does not accept floats as the shift" do
    expect { Cipher.new("put a float in the shift", 3.5) }.to raise_error(shift_error)
  end

  it "does not accept strings as the shift" do
    expect { Cipher.new("put a string in the shift", "a") }.to raise_error(shift_error)
  end

  it "does not accept nil as the shift" do
    expect { Cipher.new("put nil in the shift", nil) }.to raise_error(shift_error)
  end
end
