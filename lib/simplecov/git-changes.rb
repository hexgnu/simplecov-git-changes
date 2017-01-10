module SimpleCov
  module Formatter
    class GitChangesFormatter
      def format(result)  
        changes = git_changes(result.files.first)
        result.files.each do |file|
          file.coverage.each_with_index do |coverage, line|
            puts coverage
            puts line
            puts changes[file]
          end  
        end        
      end

      def git_changes(file)
        r = Rugged::Repository.discover(file.filename)
	diff = r.index.diff(r.branches['master'].target)

	lines_to_look_at = {}

	diff.each_patch do |patch|
	  file_info = patch.header
	  next if patch.header.match(/^\+\+\+ \/dev\/null/)
	  new_file = patch.header.match(/^\+\+\+ a\/(.*)$/)[1]
	  next if new_file !~ /\.rb\Z/
	  patch.hunks.each do |hunk|
	    lines_to_look_at[new_file] ||= []
	    lines_to_look_at[new_file] << (hunk.new_start..hunk.new_start + hunk.new_lines)
	  end
	end

	lines_to_look_at
      end
    end
  end
end
