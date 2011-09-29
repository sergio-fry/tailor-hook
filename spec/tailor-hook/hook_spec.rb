require 'helper'

describe Hook do
  it "should work" do
    hook = Hook.new(".")
    hook.hook!.must_equal 0
  end
end

