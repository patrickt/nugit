;; Forwards unknown methods to the singleton instance of NSFileManager.
(class NSFileManager
     (+ handleUnknownMessage:message withContext:context is
        ((NSFileManager defaultManager) sendMessage:message withContext:context)))
