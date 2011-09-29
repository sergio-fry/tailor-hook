require 'helper'

describe GitRepo do
  before do
    @parser = GitRepo.new(".")
  end

  it "should list staged ruby files" do
    stub(@parser).staged_files { ["file.rb", "Gemfile"] }
    @parser.staged_ruby_files.must_equal ["file.rb"]

    stub(@parser).staged_files { ["file.rb", "Gemfile", "file_2.rb"] }
    @parser.staged_ruby_files.sort.must_equal ["file.rb", "file_2.rb"]
  end
end
