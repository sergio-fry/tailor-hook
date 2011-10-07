module TailorHook
  class Hook
    def initialize(path, ignore_list=[])
      @git_repo = GitRepo.new(path)
      @ignore_list = ignore_list.map { |path| File.expand_path(path) }
    end

    def hook!
      @errors = []

      files_to_check.each do |path|
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

    def files_to_check
      staged_files - @ignore_list
    end

    def staged_files
      @git_repo.staged_ruby_files
    end
  end
end
