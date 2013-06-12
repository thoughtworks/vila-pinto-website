class TransparencyController < ApplicationController

  CEA_DROPBOX_FOLDER = 'https://www.dropbox.com/sh/5mdvv2s8r332mxw/UofqHHNdoJ'

  def index
    @files = Dropbox.new(CEA_DROPBOX_FOLDER).files
  end

  def controller_class
    'cea'
  end

end
