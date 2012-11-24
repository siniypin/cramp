require File.expand_path("../../test_helper", __FILE__)

class MultipleRenderingTest < Cramp::TestCase

  class MultipleController < Cramp::Action
    def start
      render "Camera"
      render "Obscura"
      finish
    end
  end

  def app
    MultipleController
  end

  def test_multiple_body
    get_body_chunks '/', :count => 2 do |chunks|
      assert "Camera", chunks[0]
      assert "Obscura", chunks[1]
    end
  end

end