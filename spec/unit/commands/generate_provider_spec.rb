require_relative '../../spec_helper'

describe TM::Commands::GenerateProvider do 

  include_context 'task_commands_context' do 
    let(:provider_name) { 'testprovider' }
    let(:tmp_dir) { '/tmp' }

    pending "creates provider skeleton" do 
      subject do 
        TM::Commands::GenerateProvider.create("provider_name")
      end

      it "creates directory with provider name" do 
        File.exists?("taskmapper-#{provider_name}").should be_true
      end

    end

  end

end
