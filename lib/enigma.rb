require 'keygen'
require 'time'
require 'encrypt'

class Enigma
  attr_reader :key_library

  def initialize
    @key_library = Key_Library.new
  end

  def encrypt(message, key = Keygen.new, date = Date.today)
    
  end

end
