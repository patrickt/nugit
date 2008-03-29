(class NSFileManager
     ;; Forwards unknown methods to the singleton instance of NSFileManager.
     (+ (id) handleUnknownMessage:(id)message withContext:(id)ctx is
        ((NSFileManager defaultManager) sendMessage:message withContext:ctx)))
