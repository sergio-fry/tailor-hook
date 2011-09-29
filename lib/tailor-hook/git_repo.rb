module TailorHook
  class GitRepo
    def initialize(path)
      @path = File.expand_path path
    end

    def staged_ruby_files
      staged_files.find_all { |f| f.match /\.rb$/ }
    end

    private

    def staged_files
      files = `cd #{@path} ; git diff --name-only --staged`.split

      # filter deleted files
      files.map { |p| File.expand_path(p) }.find_all { |p| File.exists? p }
    end
  end
end
