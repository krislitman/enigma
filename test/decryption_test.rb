# require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/enigma'
require './lib/decryption'

class DecryptionTest < Minitest::Test
  def test_it_exists
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_instance_of Decryption, decrypt
  end

  def test_decrypt_can_generate_random_number
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = decrypt.generate_random_number
    assert_equal 5, expected.length
    assert_equal String, expected.class
  end

  def test_it_can_generate_offsets
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = ["1", "0", "2", "5"]
    assert_equal expected, decrypt.generate_offsets("040895")
  end

  def test_random_number_generation
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = decrypt.generate_random_number
    assert_equal 5, expected.length
    assert_equal String, expected.class
  end

  def test_date_conversion
    decrypt = Decryption.new("keder ohulw", "02715", "010693")
    assert_equal 6, decrypt.generate_date.length
    refute "010693" == decrypt.generate_date
  end

  def test_it_can_deconstruct_a_phrase
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, decrypt.deconstruct("keder ohulw")
  end

  def test_find_rshift
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    assert_equal (-23), decrypt.find_rshift(["k", "e", "d", "e"], 27, 1)
  end

  def test_first_reversal
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["h", "e", "d", "e"], ["o", " ", "o", "h"], ["r", "l", "w"]]
    assert_equal expected, decrypt.first_reversal
  end

  def test_second_reversal
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "d", "e"], ["r", " ", "o", "h"], ["u", "l", "w"]]
    assert_equal expected, decrypt.second_reversal
  end

  def test_third_reversal
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "l", "e"], ["r", " ", "w", "h"], ["u", "l", "d"]]
    assert_equal expected, decrypt.third_reversal
  end

  def test_fourth_reversal
    decrypt = Decryption.new("keder ohulw", "02715", "040895")
    expected = [["k", "e", "d", "l"], ["r", " ", "o", "o"], ["u", "l", "w"]]
    assert_equal expected, decrypt.fourth_reversal
  end
end
