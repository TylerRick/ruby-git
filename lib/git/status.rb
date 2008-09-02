module Git
  
  class Status
    include Enumerable
    
    @base = nil
    @files = nil
    
    def initialize(base)
      @base = base
      @to_be_committed, @not_updated, @untracked = @base.lib.status
    end
    
    def modified
      @to_be_committed.select { |file, status| status == :modified }.map{|f,s| f} +
      @not_updated.    select { |file, status| status == :modified }.map{|f,s| f}
    end
    
    def new
      @to_be_committed.select { |file, status| status == :new }.map{|f,s| f}
    end

    def deleted
      @to_be_committed.select { |file, status| status == :deleted }.map{|f,s| f} +
      @not_updated.    select { |file, status| status == :deleted }.map{|f,s| f}
    end
    
    # this, unlike the original version, respects your ignore files
    def untracked
      @untracked
    end
    
    # enumerable method
    
#    def [](file)
#      @files[file]
#    end
#    
#    def each
#      @files.each do |k, file|
#        yield file
#      end
#    end
    
#    class StatusFile
#      attr_accessor :path, :type, :stage, :untracked
#      attr_accessor :mode_index, :mode_repo
#      attr_accessor :sha_index, :sha_repo
#      
#      @base = nil
#      
#      def initialize(base, hash)
#        @base = base
#        @path = hash[:path]
#        @type = hash[:type]
#        @stage = hash[:stage]
#        @mode_index = hash[:mode_index]
#        @mode_repo = hash[:mode_repo]
#        @sha_index = hash[:sha_index]
#        @sha_repo = hash[:sha_repo]
#        @untracked = hash[:untracked]
#      end
#      
#      def blob(type = :index)
#        if type == :repo
#          @base.object(@sha_repo)
#        else
#          @base.object(@sha_index) rescue @base.object(@sha_repo)
#        end
#      end


    end
    
end
