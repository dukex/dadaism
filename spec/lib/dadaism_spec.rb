# encoding: utf-8

require 'spec_helper'

describe DadaismGenerator do
  let(:dadaism) { DadaismGenerator.new({source: "google.com"}) }

  describe "TYPES" do
    %w{Monóstico Dístico Terceto Quarteto Quintilha Sextilha Septilha Oitava Nona Décima}.each do |type_name|
      it "should have include #{type_name}" do
        expect(DadaismGenerator::TYPES.include?(type_name)).to eq(true)
      end
    end
  end

  describe "words=" do
    it "should remove start space" do
      dadaism.words=[" vamos", " sair"]
      expect(dadaism.words).to eq(["vamos", "sair"])
    end

    it "should remove any non-word character" do
      dadaism.words=["?# vamos", " sair^?", ")agora)("]
      expect(dadaism.words).to eq(["vamos", "sair", "agora"])
    end

    it "should remove \r, \n and \t character" do
      dadaism.words=["?# va\rmos\t", " sa\ri
        r^?", ")agora)("]
      expect(dadaism.words).to eq(["vamos", "sair", "agora"])
    end

    it "should downcase words" do
      dadaism.words = ["Quero", "vEm"]
      expect(dadaism.words).to eq(["quero", "vem"])
    end

    it "should remove small words" do
      dadaism.words = ["a", "E", "do", "quero", "vem"]
      expect(dadaism.words).to eq(["a", "e", "quero", "vem"])
    end

    it "should remove only numbers values" do
      dadaism.words = ["432", "E", "do", "quero", "vem"]
      expect(dadaism.words).to eq(["e", "quero", "vem"])
    end
  end

  describe "cut_the_newspaper" do
    before(:each) do
      dadaism.stub!(:newspaper).and_return("<div class='entry-content'><p>quero vem</p></div>")
    end

    it "should save the newspaper words" do
      dadaism.cut_the_newspaper
      expect(dadaism.words).to eq(["quero", "vem"])
    end
  end
end