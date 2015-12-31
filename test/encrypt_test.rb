require 'minitest'

class EncryptTest < Minitest::Test

  attr_reader :encrypt

  def setup
    key = "12345"
    message = "a"
    date = "010116"
    @encrypt = Encrypt.new(message, key, date)
  end

  def test_encrypt_class
    skip
    assert_equal Encrypt, encrypt.class
  end

  def test_key_state
    skip
    assert encrypt.key
  end

  def test_first_rotation
    skip
    assert_equal "12", encrypt.first_rotation
  end

  def test_second_rotation
    skip
    assert_equal "23", encrypt.second_rotation
  end

  def test_third_rotation
    skip
    assert_equal "34", encrypt.third_rotation
  end

  def test_fourth_rotation
    skip
    assert_equal "45", encrypt.fourth_rotation
  end

  def test_date_state
    skip
    assert_equal 010116**2.to_s[-4..-1], encrypt.date
  end

  def test_first_offset
    skip
    assert_equal encrypt.date[0], encrypt.first_offset
  end

  def test_second_offset
    skip
    assert_equal encrypt.date[1], encrypt.second_offset
  end

  def test_third_offset
    skip
    assert_equal encrypt.date[2], encrypt.third_offset
  end

  def test_fourth_offset
    skip
    assert_equal encrypt.date[3], encrypt.fourth_offset
  end

  def test_encrypt_one_char
    skip
    assert_equal "o", encrypt.encrypt("a")
  end

  def test_encrypt_two_chars
    skip
    assert_equal "oy", encrypt.encrypt("aa")
  end

  def test_encrypt_three_chars
    skip
    assert_equal "oyp", encrypt.encyrpt("aaa")
  end

  def test_encrypt_four_chars
    skip
    assert_equal "oypy", encrypt.encyrpt("aaaa")
  end

  def test_encrypt_pattern_of_four
    skip
    assert_equal "oypyoypy", encrypt.encyrpt("aaaaaaaa")
  end

end
