require_relative "./benning_violins/version"
require_relative "./benning_violins/CLI"
require_relative "./benning_violins/inventory"
require_relative "./benning_violins/instrument"
require_relative "./benning_violins/scraper"


require 'pry'
require 'nokogiri'
require 'open-uri'
require 'colorize'
require 'word_wrap'
require 'word_wrap/core_ext'


module BenningViolins
  class Error < StandardError; end
  # Your code goes here...
end
