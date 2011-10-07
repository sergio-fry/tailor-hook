require 'helper'

describe Hook do
  it "should work" do
    hook = Hook.new(".")
    hook.hook!.must_equal 0
  end

  it "should ignore listed files" do
    hook = Hook.new(".", ["ignore_file.rb"])
    stub(hook).staged_files do
      ["file1.rb", "ignore_file.rb"].map { |path| File.expand_path(path) }
    end

    hook.send(:files_to_check).must_equal [File.expand_path("file1.rb")]
  end
end

