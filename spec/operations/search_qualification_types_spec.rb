require File.expand_path(File.join(File.dirname(__FILE__), '..', 'spec_helper'))

describe RTurk::SearchQualificationTypes do
  before(:all) do
    aws = YAML.load(File.open(File.join(SPEC_ROOT, 'mturk.yml')))
    RTurk.setup(aws['AWSAccessKeyId'], aws['AWSAccessKey'], :sandbox => true)
    faker('search_qualification_types', :operation => 'SearchQualificationTypes')
  end

  it "should ensure required params" do
    lambda{RTurk::SearchQualificationTypes()}.should raise_error RTurk::MissingParameters
  end

  it "should successfully request the operation" do
    RTurk::Requester.should_receive(:request).once.with(
      hash_including('Operation' => 'SearchQualificationTypes'))
    RTurk::SearchQualificationTypes(:requestable => true) rescue RTurk::InvalidRequest
  end

  it "should parse and return the result" do
    response = RTurk::SearchQualificationTypes(:requestable => false)
    response.num_results.should == 10
    response.total_results.should == 90
    # check for a system qualification type record?
  end
end
