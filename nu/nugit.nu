(load "Nugit:extensions")
(load "Nugit:helpers")

(class GitBlob is NSObject
     
     (ivars) (ivar-accessors)
     
     (- (id) initWithPath:(id)p forSession:(id)s is
        (set @path p)
        (set @contents (self filesystemContents))
        (set @session s)
        self)
     
     (- (id) filesystemContents is
        (NSString
                 stringWithContentsOfFile: "#{(@session repoLoc)}/#{@path}"
                 encoding: UNICODE
                 error: nil))
     
     (- (id) revisionHashes is
        (set huge-output (($session command: "rev-list HEAD #{@path}") stripWhitespace))
        (set hashes (/\n/ splitString: huge-output))
        (hashes removeLastObject)
        (puts (hashes count))
        hashes)
     
     (- (id) contentsForRevisionHash:(id)hash is
        (@session command: "show #{hash}:#{@path}"))
     
     (- (id) headRevision is
        (@session command: "show :#{@path}"))
     
     (- (id) revisionsAgo:(int)ago is
        (@session command: "show @{#{ago}}:#{@path}"))
     
     (- (id) writeString:(id)string is
        (string
               writeToFile: "#{$repository}/#{@path}"
               atomically: YES
               encoding: UNICODE
               error: nil))
     
     (- (void) add is
        (@session command: "add #{@path}")))


(class GitSession is NSObject
     (ivars) (ivar-accessors)
     
     (- (id) initInDirectory:(id)loc is
        (super init)
        
        (set @repoLoc loc)

        (unless (NSFileManager directoryContentsAtPath: "#{@repoLoc}/.git")
                (puts "Initializing new git repository.")
                (self command: "init"))
        self)
     
     (- (id) command:(id)text is
        (set oldDir (NSFileManager currentDirectoryPath))
        (NSFileManager changeCurrentDirectoryPath: @repoLoc)
        (puts "Nu: git #{text}")
        (set command (shell "git #{text}"))
        (NSFileManager changeCurrentDirectoryPath: oldDir)
        command)
     
     (- (id) commit is
        (self command: "commit -m 'Automatically generated commit from the Nu/Git interface.'"))
     
     (- (id) fileExists:(id)path is
        (NSFileManager fileExistsAtPath: "#{@repoLoc}/#{path}"))
     
     (- (id) createBlob:(id)path withContents:(id)contents is
        (shell "touch #{@repoLoc}/#{path}")
        (set blob ((GitBlob alloc) initWithPath:path forSession:self))
        (blob writeString: contents)
        (blob add)
        blob)
     
     (- (id) fetchBlob:(id)path is
        (puts "Fetching blob.")
        (set b ((GitBlob alloc) initWithPath:path forSession:self)
             b)))
