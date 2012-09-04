require 'skipjack'

describe Skipjack::Cipher do

  let(:w) { [0x3322, 0x1100, 0xddcc, 0xbbaa] }
  let(:key) { [0x00, 0x99, 0x88, 0x77, 0x66, 0x55, 0x44, 0x33, 0x22, 0x11] }
  let(:cipher) { Skipjack::Cipher.new(key) }

  it "should pass official tests" do
    w_c = cipher.encode_block(w)
    (w_c[0..1].to_double_word.to_s(16) + w_c[2..3].to_double_word.to_s(16)).should match '2587cae27a12d300'
    w_p = cipher.decode_block(w_c)
    w_p.map {|elem| elem.to_s(16)}.join('').should match '33221100ddccbbaa'
  end

  describe "#new" do

    it 'should raise error if key is not an array' do
      [1, '1', {}].each do |key|
        lambda { Skipjack::Cipher.new(key) }.should raise_error
      end
    end

    it 'should raise error if key length is not equals 10' do
      key = [0x1]
      lambda { Skipjack::Cipher.new(key) }.should raise_error
    end

    it 'should raise error if one of key array elements is not a byte' do
      key = [0x0, 0x1, 0x2, 0x3, 0x4, 0x5, 0x6, 0x7, 0x8, 0xFFFFF]
      lambda { Skipjack::Cipher.new(key) }.should raise_error
    end
  end

  describe '#encode' do

    it 'should return string value' do
      cipher.encode('some string').should be_a String
    end

    it 'should raise error if parameter is not a String' do
      [[], {}, 1].each do |arg|
        lambda{ cipher.encode(arg) }.should raise_error
      end
    end
  end

end
