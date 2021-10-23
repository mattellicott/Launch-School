
def block_word?(string)
  blocks = [%w[B O], %w[X K], %w[D Q], %w[C P], %w[N A], %w[G T],
            %w[R E], %w[F S], %w[J W], %w[H U], %w[V I], %w[L Y], %w[Z M]]

  result = string.upcase.chars.select do |letter|
    if blocks.any? { |c| c.include?(letter) }
      index = blocks.index(blocks.detect { |i| i.include?(letter) })
      subindex = blocks[index].index(letter)
      blocks[index].delete_at(subindex)
      !blocks.select { |y| y.size >= 1 }.empty?
    else
      false
    end
  end
  return true if result.join == string.upcase
end

p block_word?('BATCH') == true
p block_word?('BUTCH') == false
p block_word?('jest') == true
