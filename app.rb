# encoding: utf-8
require 'bundler'

Bundler.require
$:.unshift(File.expand_path(File.join(File.dirname(__FILE__), "lib")))

require 'dadaism'

class DadaismApp < Sinatra::Base
  get "/" do
    @types = DadaismGenerator::TYPES
    haml :index
  end

  post "/poem" do
    poem_params = params[:poem]
    @poem = DadaismGenerator.new poem_params
    haml :poem
  end
end