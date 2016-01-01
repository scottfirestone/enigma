require 'char_library'

class Encrypter

  attr_accessor :key, :offsets, :char_library, :input

  extend CharLibrary

  def initialize(key, input, date)
    @key = key
    @input = input.chars
    @offsets = find_offsets(date)
    @char_library = CharLibrary::CHAR_LIBRARY
    @output = []
  end

  def find_offsets(date)#expecting date received in 8 digit string format
    (sprintf('%08d', date).to_i**2).to_s[-4..-1]
  end

  def first_rotation
    key[0..1].to_i
  end

  def second_rotation
    key[1..2].to_i
  end

  def third_rotation
    key[2..3].to_i
  end

  def fourth_rotation
    key[3..4].to_i
  end

  def first_offset
    offsets[0].to_i
  end

  def second_offset
    offsets[1].to_i
  end

  def third_offset
    offsets[2].to_i
  end

  def fourth_offset
    offsets[3].to_i
  end

  def message_chunker(message)
    message.each_char.each_slice(4).map(&:join)
  end

  def find_char_value(char)
    char_library[char]
  end

  def find_char_equivalent(num)
    char_library.key(num)
  end

  def encrypt_chunk(chunk)
    encrypted_chunk_nums = chunk.map.with_index do |char, index|
      case index
        when 0
        find_char_value(char) + first_rotation + first_offset
        when 1
        find_char_value(char) + second_rotation + second_offset
        when 2
        find_char_value(char) + third_rotation + third_offset
        when 3
        find_char_value(char) + fourth_rotation + fourth_offset
      end
    end
    encrypted_chunk_nums.map do |element|
      element = find_char_equivalent(element)
    end
  end

  def encrypt(message)
    chunks_array = message_chunker(message)
    @output = chunks_array.each do |chunk|
      chunk.compact
      encrypt_chunk(chunk)
    end.join
  end
end
