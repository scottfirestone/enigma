require 'key_library'

class Keygen
  attr_reader :key

  def initialize
    @key = generate_new_key
  end

  def generate_new_key
    sprintf('%05d', rand(99999)).to_s
  end

end
