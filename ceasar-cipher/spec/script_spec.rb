require_relative "../script"

describe "Ceasar encrypting method:" do
  context "text only contain letters" do
    it "One letter" do
      text = "aaaaaaAAAAAAA"
      result = ceasar_cipher(text, 25)
      expect(result).to eq("zzzzzzZZZZZZZ")
    end

    it "It loops" do
      text = "zZzZzZzZ"
      result = ceasar_cipher(text, 3)
      expect(result).to eq("cCcCcCcC")
    end

    it "shift is larger than 26" do
      text = "aaaaAAAA"
      result = ceasar_cipher(text, 28)
      expect(result).to eq("ccccCCCC")
    end

    it "shift is negative" do
      text = "alSdf"
      result = ceasar_cipher(text, -2)
      expect(result).to eq("yjQbd")
    end

    it "shift is smaller than -26" do
      text = "RockerFlLer"
      result = ceasar_cipher(text, -100)
      expect(result).to eq("VsgoivJpPiv")
    end

    it "HelloWorld" do
      text = "HelloWorld"
      result = ceasar_cipher(text, 5)
      expect(result).to eq("MjqqtBtwqi")
    end
  end

  context "Contain more than letters" do
    it "Return the same string" do
      text = "@#!&*#^!*3123    (*@#!*^)"
      result = ceasar_cipher(text, 13)
      expect(result).to eq(text)
    end

    it "leave everything except letters alone" do
      text = "@#!&*#^!*  aZaZ  (*@#!*^)"
      result = ceasar_cipher(text, 13)
      expect(result).to eq("@#!&*#^!*  nMnM  (*@#!*^)")
    end
  end
end
