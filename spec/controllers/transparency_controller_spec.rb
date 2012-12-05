require 'spec_helper'

describe TransparencyController do
  describe '#index' do
    context 'when listing' do
      it 'should expose list of files in the dropbox public folder' do
        files = [{:name => "podemon.pdf", :url => "http://www.nintendo.com/pokemon.pdf?dl=1"}, 
                                         {:name => "sonic.pdf", :url => "http://www.sega.com/sonic.pdf?dl=1"}] 

        Dropbox.any_instance.stub(:files).and_return(files)
        get :index, :locale => 'pt-BR'

        should respond_with(:success)
        should assign_to(:files).with(files)
        should render_template('index')
      end
    end
  end
end