require 'test_helper'

class GoogleAjaxSearchTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "web search call" do
    assert GoogleAjaxSearch.web_search(:q => 'test').size
  end
end
