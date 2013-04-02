require_relative '../../spec_helper'

describe TM::Commands::FirstTask do 
  include_context 'task_commands_context' do 
    context :execute do 
      subject { TM::Commands::FirstTask.new(provider_handler, formatter).execute }
      it { should_not be_nil }
    end
  end
end
