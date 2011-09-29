module TailorHook
  class Hook
    def initialize(path)
      @git_repo = GitRepo.new(path)
    end

    def hook!
      @errors = []

      @git_repo.staged_ruby_files.each do |path|
        check_file(path)
      end


      if @errors.empty?
        result = 0
      else
        @errors.each { |e| print e }
        result = 1
      end

      result
    end

    private

    def check_file(path)
      output = `tailor #{path}`

      unless $?.success?
        @errors << output
      end
    end
  end
end
