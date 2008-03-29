;; test_nugit.nu
;; Tests for the Nu/Git interface.
;;
;; (c) Copyright 2008 Patrick Thomson. Released under the Apache license.

(load "Nugit")

(class NuTestCase
     
     (ivars)
     
     (- (id) setFilePaths is
        (set cwd ((NSFileManager defaultManager) currentDirectoryPath))
        (set @test_dir (cwd stringByAppendingPathComponent: "files"))
        (set @wdir_dot (@test_dir stringByAppendingPathComponent: "working"))
        (set @wbare (@test_dir stringByAppendingPathComponent: "working.git"))))

(class NugitTest is NuTestCase
     
     (- (id) setup is
        (self setFilePaths)
        (set @git (Git open: @test_dir)))
     
     (- (id) testSomething is
        (assert_equal Git Git)))