require 'date'
require_relative 'generator'
require_relative 'enigma'

class Decryption < Enigma
  include Generator

    attr_reader :a_key,
                :b_key,
                :c_key,
                :d_key

  def initialize(phrase, key, date)
    @character_set = (("a".."z").to_a << " ")
    @phrase = deconstruct(phrase)
    @key = key
    @date = date
    @offsets = generate_offsets(date)
    @keys = generate_keys(key, date)
  end

  def deconstruct(phrase)
    phrase.split("").each_slice(4).to_a
  end

  def first_reversal
    generate_reversal(@a_key, 0)
  end

  def second_reversal
    generate_reversal(@b_key, 1)
  end

  def third_reversal
    generate_reversal(@c_key, 2)
  end
end
