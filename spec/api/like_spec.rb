# Copyright (c) Microsoft Corporation
# All rights reserved.
# Licensed under the Apache License, Version 2.0 (the "License"); 
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0 
#
# THIS CODE IS PROVIDED *AS IS* BASIS, WITHOUT WARRANTIES OR 
# CONDITIONS OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING 
# WITHOUT LIMITATION ANY IMPLIED WARRANTIES OR CONDITIONS OF TITLE,
# FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABLITY OR NON-INFRINGEMENT. 

# See the Apache Version 2.0 License for specific language governing
# permissions and limitations under the License.

require File.expand_path('../../spec_helper', __FILE__)

describe Yammer::Api::Topic do

  before :all do
    @client = Yammer::Client.new(
      :site_url     => 'https://www.yammer.com',
      :client_id     => 'PRbTcg9qjgKsp4jjpm1pw',
      :client_secret => 'Xn7kp7Ly0TCY4GtZWkmSsqGEPg10DmMADyjWkf2U',
      :access_token  => 'TolNOFka9Uls2DxahNi78A'
    )
  end

  subject { @client }

  describe '#likes' do
    it 'should check if user likes open graph object' do
      subject.should_receive(:get).with('/api/v1/likes/open_graph_object/1')
      subject.likes_open_graph_object?(1)
    end

    it 'should like open graph object' do
      subject.should_receive(:post).with('/api/v1/likes', :id => 1, :type => 'OpenGraphObject')
      subject.like('OpenGraphObject', 1)
    end

    it 'should unlike open graph object' do
      subject.should_receive(:delete).with('/api/v1/likes/1')
      subject.unlike(1)
    end
  end
end