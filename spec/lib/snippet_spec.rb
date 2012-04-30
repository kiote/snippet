# encoding: utf-8
$LOAD_PATH << File.expand_path('../../', __FILE__)
require 'spec_helper'

describe Snippet do
  describe 'any-style' do
    before do
      @obj = Snippet.new('http://stackoverflow.com/questions/3837717/get-html-of-external-url-in-jquery')
    end

    it 'should return valid hash' do
      @obj.get_meta[:img].must_be_kind_of String
      @obj.get_meta[:title].must_be_kind_of String
      @obj.get_meta[:text].must_be_kind_of String
    end
  end
end
