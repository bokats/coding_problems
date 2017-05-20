def solution(s)

  current_sentence = ""
  sentences = []
  s.each_char do |char|
    if char == "." || char == "!" || char == "?"
      sentences << current_sentence
      current_sentence = ""
    else
      current_sentence += char
    end
  end

  unless current_sentence.empty?
    sentences << current_sentence
  end

  max_words_length = 0

  sentences.each do |sentence|
    words = sentence.split(" ")
    if words.length > max_words_length
      max_words_length = words.length
    end
  end
  max_words_length
end

p solution("") == 0
p solution("baf vdssd. vdgds feafaf ? fsafa fsaeee fewews vdaa") == 4
