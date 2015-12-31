require 'minitest'
require 'keygen'

class KeygenTest < Minitest::Test
  attr_reader :keygen

  def setup
    @keygen = Keygen.new
  end

  def test_keygen_instance
    assert_equal Keygen, keygen.class
  end

  def test_initialized_has_key_attribute
    assert keygen.key
  end

  def test_generate_key_method_response
    assert_respond_to @keygen, :generate_new_key
  end

  def test_key_is_string
    assert_equal String, keygen.key.class
  end

  def test_key_has_5_digits
    assert_equal 5, keygen.key.length
  end

end
