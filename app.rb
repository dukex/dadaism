# encoding: utf-8
require 'bundler'

Bundler.require

require 'open-uri'

class String
  def remove_start_space
    self.gsub(/\r|\t|^\w/, "")
  end

  def clean_word
    self.remove_pontaction
  end

  def remove_pontaction
    self.gsub(/\.|,|\$|:|\(|\)|\"|“/, "")
  end
end


#html = open("http://g1.globo.com/natureza/noticia/2012/08/brasil-retrocede-em-leis-federais-de-protecao-amazonia.html").read
#parser = Nokogiri::HTML(html);
#words = parser.search(".entry-content p").text.split("\n").map(&:remove_start_space).join("\n").split(" ")#.map(&:clean_word)

#binding.pry
#.delete_if{|w| (w.size < 3 && w.size != /a|e|i|o|u/) or w.match(/^\d+$/) }.flatten

#puts words
=begin
word_count = 0
verso_count = 0
estrofe = 0


max_verso = 4
max_word = 4



words.shuffle.each_with_index do |word, i|
  next if word == words[i-1]
  next if (max_word == (word_count+1) or  word_count == 0) and word.size < 3
  word_count = word_count+1
  word = word.gsub(".", "").gsub(/,$/, "").gsub(/ +/, "")

  extra = " "

  if word_count == max_word
    extra = "\n"
    word_count = 0
    verso_count = verso_count+1
    if verso_count == max_verso
      extra = "\n\n"
      verso_count = 0
      estrofe = estrofe+1
    end
  end

  print word.downcase + extra

  exit if estrofe == max_verso
end
=end
