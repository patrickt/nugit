(load "test")

(class NuTestCase
     (- (id) setFilePaths is
          (set cwd ((NSFileManager defaultManager) currentDirectoryPath))
          (set @test_dir (cwd stringByAppendingPathComponent: "files"))
          (set @wdir_dot (@test_dir stringByAppendingPathComponent: "working"))
          (set @wbare (@test_dir stringByAppendingPathComponent: "working.git")))