require 'minitest'
require 'enigma'

class EnigmaTest < Minitest::Test

  def setup
    @e = Enigma.new
  end

  def test_instance_of_enigma
    assert Enigma, @e.class
  end

  def test_enigma_respond_to_encrypt_method
    assert_respond_to @e, :encrypt
  end

  def test_encrypt_method_takes
end
