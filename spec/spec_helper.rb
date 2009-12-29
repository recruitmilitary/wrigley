$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'wrigley'
require 'spec'
require 'spec/autorun'
require 'fakeweb'

FakeWeb.allow_net_connect = false
FakeWeb.register_uri(:get, "http://jobs-wrigley.icims.com/jobs/search?pr=1", :body => File.read(File.dirname(__FILE__) + "/fixtures/search.html"))
FakeWeb.register_uri(:get, "http://jobs-wrigley.icims.com/jobs/search?pr=2", :body => File.read(File.dirname(__FILE__) + "/fixtures/search_p2.html"))
FakeWeb.register_uri(:get, "http://jobs-wrigley.icims.com/jobs/search?pr=3", :body => File.read(File.dirname(__FILE__) + "/fixtures/search_p3.html"))
FakeWeb.register_uri(:get, "http://jobs-wrigley.icims.com/jobs/4262/job", :body => File.read(File.dirname(__FILE__) + "/fixtures/job.html"))

Spec::Runner.configure do |config|

end
