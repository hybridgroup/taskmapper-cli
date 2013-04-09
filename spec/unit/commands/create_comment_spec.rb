require_relative '../../spec_helper'

describe TM::Commands::CreateComment do 
  include_context 'task_commands_context' do

    context :execute do 
      before :each do 
        ticket.should_receive(:comment!).and_return(true)
      end
      subject do 
        TM::Commands::CreateComment.new(provider_handler, 
                                                formatter).execute('title:test', 'body:new') 
      end
      it { should_not be_nil }
    end

  end
end
