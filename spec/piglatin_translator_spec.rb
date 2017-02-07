require_relative '../piglatin_translator'

describe PiglatinTranslator do
  context "translate" do
    subject(:translator) { PiglatinTranslator.new(input) }

    context "when given a word that starts with a consonant" do
      let(:input) { "hello" }

      it "appends the end of the word and adds letters" do
        expect(translator.translate).to eq "ellohay"
      end
    end

    context "when given a word that starts with a vowel" do
      let(:input) { "apples" }

      it "adds 'ay'" do
        expect(translator.translate).to eq "applesay"
      end
    end

    context "when given a word that is capitalized" do
      context "and the word starts with a consonant" do
        let(:input) { "World" }

        it "preserves the capitalization" do
          expect(translator.translate).to eq "Orldway"
        end
      end
      context "and the word starts with a vowel" do
        let(:input) { "Apples" }

        it "preserves the capitalization" do
          expect(translator.translate).to eq "Applesay"
        end
      end
    end

    context "when given a phrase with mutiple words" do
      let(:input) { "hello apples" }

      it "translate each word in the phrasee" do
        expect(translator.translate).to eq "ellohay applesay"
      end
    end

    context "when given a sentence containing punctuation" do
      let(:input) { "hello...  apples?!" }

      it "translate each word and preserves the non-word characters" do
        expect(translator.translate).to eq "ellohay...  applesay?!"
      end
    end
  end
end
