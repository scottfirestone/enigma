require 'minitest'
require 'encrypter'
require 'pry'

class EncryptTest < Minitest::Test

  attr_reader :encrypter

  def setup
    key = "12345"
    input = "a"
    date = "010116"
    @encrypter = Encrypter.new(key, input, date)
    @char_library = CharLibrary::CHAR_LIBRARY
  end

  def test_encrypter_class
    assert_equal Encrypter, encrypter.class
  end

  def test_key_state
    assert encrypter.key
  end

  def test_starting_a_value_from_char_library
    assert_equal 0, encrypter.find_char_value("a")
  end

  def test_message_chunker_creates_array_from_string
    assert_equal Array, encrypter.message_chunker("aaaa").class
  end

  def test_message_chunker_creates_1_chunk
    assert_equal 1, encrypter.message_chunker("aaaa").size
  end

  def test_message_chunk_creates_2_chunks
    assert_equal 2, encrypter.message_chunker("aaaaa").size
  end

  def test_encrypt_chunk_one_char
    assert_equal ["o"], encrypter.encrypt_chunk(["a"])
  end

  def test_encrypt_chunk_two_char
    assert_equal ["oy"], encrypter.encrypt_chunk(["aa"])
  end

  def test_first_rotation
    assert_equal 12, encrypter.first_rotation
  end

  def test_second_rotation
    assert_equal 23, encrypter.second_rotation
  end

  def test_third_rotation
    assert_equal 34, encrypter.third_rotation
  end

  def test_fourth_rotation
    assert_equal 45, encrypter.fourth_rotation
  end

  def test_offsets_state
    assert_equal (010116**2).to_s[-4..-1], encrypter.offsets
  end

  def test_first_offset
    assert_equal 2, encrypter.first_offset
  end

  def test_second_offset
    assert_equal 2, encrypter.second_offset
  end

  def test_third_offset
    assert_equal 7, encrypter.third_offset
  end

  def test_fourth_offset
    assert_equal 6, encrypter.fourth_offset
  end

  def test_encrypt_one_char
    skip
    assert_equal "o", encrypter.encrypt("a")
  end

  def test_encrypter_two_chars
    skip
    assert_equal "oy", encrypter.encrypt("aa")
  end

  def test_encrypter_three_chars
    skip
    assert_equal "oyp", encrypter.encrypt("aaa")
  end

  def test_encrypter_four_chars
    skip
    assert_equal "oypy", encrypter.encrypt("aaaa")
  end

  def test_encrypter_pattern_of_four
    skip
    assert_equal "oypyoypy", encrypter.encrypt("aaaaaaaa")
  end

end
