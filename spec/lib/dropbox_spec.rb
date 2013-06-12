require 'spec_helper'

describe Dropbox do

  it "reads file data from the html" do
    parser = Dropbox.new File.dirname(__FILE__) + "/../resources/dropbox.html"

    expected_file_1 = {
      :name => "Pokemon - Fire Red.GBA",
      :url => "https://www.dropbox.com/sh/5mdvv2s8r332mxw/yQ7EC3RL3F/Pokemon%20-%20Fire%20Red.GBA?dl=1"
    }

    expected_file_2 = {
      :name => "scala-impatient.pdf",
      :url => "https://www.dropbox.com/sh/5mdvv2s8r332mxw/YyKv_-GRMY/scala-impatient.pdf?dl=1"
    }

    parser.files.should include expected_file_1
    parser.files.should include expected_file_2
  end

end
