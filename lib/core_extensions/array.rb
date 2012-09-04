class Array
  def to_word
    convert_word 8
  end

  def to_double_word
    convert_word 16
  end

  private

  def convert_word(word_size)
    raise 'You should pass array of size 2' if self.size > 2
    b1 = self[0].ord.to_s(2)
    b1 = '0' + b1 until b1.size == word_size
    b2 = self[1].ord.to_s(2)
    b2 = '0' + b2 until b2.size == word_size
    (b1 + b2).to_i(2)
  end
end
