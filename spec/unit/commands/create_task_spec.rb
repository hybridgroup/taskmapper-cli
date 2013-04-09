require_relative '../../spec_helper'

describe TM::Commands::CreateTask do 

  include_context 'task_commands_context' do 
    before :each do 
      project.should_receive(:ticket!).and_return(true)
    end

    context :execute do 
      subject do 
        TM::Commands::CreateTask.new(provider_handler, formatter).execute('description:hello')
      end
      it { should_not be_nil }
    end
  end
end
