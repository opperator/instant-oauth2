require 'spec_helper'
require 'base64'

describe InstantOAuth2::Helpers::Global do
  subject{ k = Class.new; k.send(:include, InstantOAuth2::Helpers::Global); k.new }
  let(:client_class){ mock }

  before do
    InstantOAuth2.configure do |config|
      config.client_class = client_class
    end
  end

  describe '#client_application' do
    context 'with HTTP Basic passed' do
      it 'should call through to the client application class locate method' do
        subject.stub!(:env).and_return({
          'HTTP_AUTHORIZATION' => "Basic #{Base64.encode64('id:secret')}"
        })

        client_class.should_receive(:locate).with('id','secret')
        subject.client_application
      end
    end

    context 'with client_id and client_secret parameters' do
      it 'should try to locate based on the passed params' do
        subject.stub!(:env).and_return({})
        subject.stub!(:params).and_return({
          :client_id => 'id',
          :client_secret => 'secret'
        })
        client_class.should_receive(:locate).with('id','secret')
        subject.client_application
      end
    end
  end
end
