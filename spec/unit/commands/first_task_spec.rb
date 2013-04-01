require_relative '../../spec_helper'

describe TM::Commands::FirstTask do 
  let(:tickets) { [stub] }
  let(:project) do 
    stub(:tickets => tickets)
  end
  let(:taskmapper) do 
    stub(:project => project)
  end
  let(:provider_handler) do 
    stub(:taskmapper => taskmapper)
  end
  let(:formatter) { stub(:before => true, :format => true, :after => true) }

  context :execute do 
    subject { TM::Commands::FirstTask.new(provider_handler, formatter).execute }
    it { should_not be_nil }
  end
end
