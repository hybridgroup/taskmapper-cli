require_relative '../../spec_helper'

describe TM::Commands::LastTask do 
  include_context 'task_commands_context' do 
    context :execute do 
      subject do 
        TM::Commands::LastTask.new(
          provider_handler, 
          formatter).execute 
      end
      it { should_not be_nil }
    end
  end

end
