require "ctf_party"

puts "#{ '010000100110100101101110011000010111001001111001'.from_bin } - #{ 'Binary'.to_bin }"

puts "#{ '010000101001011001110110100001100100111010011110'.from_bin(bitnumbering: :LSB) } - #{ 'Binary'.to_bin(bitnumbering: :LSB) }"

puts "#{ '010100000111010101101110010001110111001001110101011011010111000001111001'.bin2str } - #{ 'PunGrumpy'.str2bin }"

puts "#{ '0100100100100000011011000110111101110110011001010010000001010010011101010110001001111001'.bin2str } - #{ 'I love Ruby'.to_bin }"