;; test_nugit.nu
;; Tests for the Nu/Git interface.
;;
;; (c) Copyright 2008 Patrick Thomson. Released under the Apache license.

(load "Nugit")

(class NugitTest is NuTestCase
     
     (- (id) setup is
          (set @git (Git open: )))
     
     (- (id) testSomething is
          (assert_equal Git Git)))