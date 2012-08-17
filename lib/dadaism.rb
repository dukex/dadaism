# encoding: utf-8

require 'open-uri'
require 'nokogiri'

class DadaismGenerator
  TYPES = [ "Monóstico", "Dístico", "Terceto", "Quarteto", "Quintilha", "Sextilha", "Septilha", "Oitava", "Nona", "Décima"]

  def initialize(options)
  end

  def words=(words)
    @words = words.map(&:initial_clean).map(&:downcase).remove_small_words
  end

  def words
    @words
  end

  def newspaper
  end

  def cut_the_newspaper
    parser = Nokogiri::HTML(newspaper)
    @words = parser.search(".entry-content p").text.split(" ")
  end
end

class String
  def initial_clean
    self.gsub(/\W+$|^\W+|\t|\r|\n/, "")
  end
end

class Array
  def remove_small_words
    self.delete_if{|word| (word.size < 3 and !word.match(/^[a|e|i|o|u]$/)) or word.match(/^\d+$/) }
  end
end