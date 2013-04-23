# encoding: utf-8
require 'spec_helper'

describe ApplicationHelper do

  describe 'Page Title' do
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

  describe 'Meta Description' do
    before { @base_description = "CEA - Centro de Educação Ambiental da Vila Pinto Porto Alegre" }

    describe 'should return a base meta description' do
      it 'when no meta description is passed' do
        meta_description("").should == @base_description
      end
      it 'when page meta description is nil' do
        meta_description(nil).should == @base_description
      end
    end

    describe 'should return a full meta description' do
      it 'when passing a meta description attribute' do
        meta_description("Meta Description Attribute").should == @base_description + " - Meta Description Attribute"
      end
    end
  end
end
