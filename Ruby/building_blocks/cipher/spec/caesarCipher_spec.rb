require "caesarCipher"

describe '#caesar_cipher' do
#test if encription is positive, negative, and zero
#test if message gives
  context "given a string and a shift number" do
    it "given 1 it shifts each character by 1" do
      expect(caesar_cipher("hi Kim", 1)).to eq("ij Ljn")
    end

    it "given -1 it shifts each character by -1" do
      expect(caesar_cipher("hi Kim", -1)).to eq("gh Jhl")
    end

    it "given 0 it doesn't shift" do
      expect(caesar_cipher("hi Kim", 0)).to eq("hi Kim")
    end

    it "given special characters, it doesn't change them" do
      expect(caesar_cipher("Hi Kim! Hi Ellie!", 5)).to eq("Mn Pnr! Mn Jqqnj!")
    end
  end

end
