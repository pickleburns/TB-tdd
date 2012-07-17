require 'spec_helper'
require 'fake_twitter'

describe FakeTwitter do
	context '#search' do
		it 'returns an array of objects who respond to text' do
			fake_twitter = FakeTwitter.new('#awesome', [{'text' => 'cool yo'}, {'text' => 'sweet bud'}])
			results = fake_twitter.search('#awesome')
			results.map(&:text).should == ['cool yo', 'sweet bud']
		end

		it "returns and empty array if the term isn't found" do
			fake_twitter = FakeTwitter.new('#awesome', [{'text' => 'cool yo'}, {'text' => 'sweet bud'}])
			results = fake_twitter.search('')
			results.should == []
		end

		it 'returns an array of Twitter::Statuses' do
			fake_twitter = FakeTwitter.new('#awesome', [{'text' => 'status'}])
			results = fake_twitter.search('#awesome')
			results.first.should be_a(Twitter::Status)
		end
	end
end