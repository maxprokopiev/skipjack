class Integer
  def to_half_bytes
    raise 'Value overflow - you should pass byte value' if self > 255
    bin = self.to_s(2)
    bin = '0' + bin until bin.size == 8
    [bin[0..3].to_i(2), bin[4..7].to_i(2)]
  end

  def to_bytes
    bin = self.to_s(2)
    bin = '0' + bin until bin.size == 16
    [bin[0..7].to_i(2), bin[8..15].to_i(2)]
  end
end
