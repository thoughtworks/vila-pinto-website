# encoding: utf-8
require 'spec_helper'

describe ApplicationHelper do
  before { @base_title = "Centro de Educação Ambiental Vila Pinto" }

  describe 'should return a base title' do
    it 'when no page title is passed' do
      page_title("").should == @base_title
    end
    it 'when page title is nil' do
      page_title(nil).should == @base_title
    end
  end

  describe 'should return a full title' do
    it 'when passing a title attribute' do
      page_title("Title Attribute").should == @base_title + " - Title Attribute"
    end
  end
end
