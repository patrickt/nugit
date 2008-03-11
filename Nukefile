;; source files
(set @nu_files      (filelist "^nu/.*nu$"))
(set @frameworks    '("Cocoa" "Nu"))

;; framework description
(set @framework 			"Nugit")
(set @framework_identifier    "nu.programming.nugit")
(set @framework_creator_code  "ptrk")

(compilation-tasks)
(framework-tasks)

(task "test" => "framework" is
      (SH "nutest test/test_nugit.nu"))

(task "clobber" => "clean" is
      (system "rm -rf #{@framework_dir}"))

(task "default" => "framework")

(task "install" => "framework" is
      (SH "ditto #{@framework_dir} /Library/Frameworks/#{@framework_dir}"))
