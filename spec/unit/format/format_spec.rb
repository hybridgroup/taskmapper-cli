require_relative '../../spec_helper'

class DummyFormat 
  include TM::Format
end

describe TM::Format do 
  let(:project) do 
    {'dump' => 2, 'id' => 1, 'name' => 'test-project', 'description' => 'my test project', 'dummy' => 'info' }
  end
  let(:ticket) do 
    {'dump' => 2, 'id' => 1, 'title' => 'Found a bug', 'state' => 'open', 'description' => 'Having problems', 'status' => 'open'}
  end
  let(:comment) do 
    {'dump' => 2, 'id' => 1, 'author' => 'me', 'body' => 'here'}
  end

  describe "when entity is a project" do 
    context :normalize_entity do 
      subject { DummyFormat.new.normalize_entity(project) }
      it { should == {'id' => 1, 'name' => 'test-project', 'description' => 'my test project'} } 
    end
  end

  describe "when entity is a ticket" do 
    context :normalize_entity do 
      subject { DummyFormat.new.normalize_entity(ticket) }
      it { should == {'id' => 1, 'title' => 'Found a bug', 'description' => 'Having problems', 'status' => 'open'} }
    end
  end

  describe "when entity is a comment" do 
    context :normalize_entry do 
      subject { DummyFormat.new.normalize_entity(comment) }
      it { should == {'id' => 1, 'author' => 'me', 'body' => 'here'} }
    end
  end
end
