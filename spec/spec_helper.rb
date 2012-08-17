# encoding: utf-8

ENV['RACK_ENV'] = "test"
Bundler.require

require 'simplecov'
SimpleCov.start

lib_dir = File.expand_path('../lib', __FILE__)
$:.unshift lib_dir unless $:.include?(lib_dir)

require 'dadaism'