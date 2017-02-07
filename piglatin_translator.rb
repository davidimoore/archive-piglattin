class PiglatinTranslator
  def initialize(words)
    @words = words
  end

  def translate
      @words.gsub(/[a-z]+/i) { |w| create_new_word(w) }
  end

  private

  def create_new_word(word)
    first_letter = word.slice(0)

    if vowels.include?(first_letter.downcase)
      new_word = word + "ay"

      finalize_word(new_word, first_letter)
    else
      remainding_word = word.slice(1..-1)
      new_ending = first_letter + "ay"
      new_word = "#{remainding_word}#{new_ending}"
      finalize_word(new_word, first_letter)
    end
  end

  def finalize_word(new_word, first_letter)
    new_word = new_word.capitalize if capitalized?(first_letter)
    new_word
  end

  def capitalized?(letter)
    letter.capitalize == letter
  end

  def vowels
    %w(a e i o u)
  end


end

