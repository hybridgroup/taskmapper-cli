require_relative '../spec_helper'

describe TM::ProviderHandler do 

  context "valid provider/authentication" do 
    let(:provider) { 'kanbanpad' }
    let(:authentication) { 'token:blah,username:user' }
    subject { TM::ProviderHandler.build_handler(provider, authentication) }
    it { should be_an_instance_of TM::ProviderHandler }
    its(:taskmapper) { should be_an_instance_of TaskMapper }
  end

  context "invalid provider" do 
    let(:provider) { '' } 
    let(:authentication) { 'username' }
    subject { lambda { TM::ProviderHandler.build_handler(provider, authentication) } } 
    it { should raise_error "Provider doesn't exists" }
  end

end
