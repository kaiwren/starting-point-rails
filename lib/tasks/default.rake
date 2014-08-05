require 'jslint/tasks'

Rake::Task[:default].clear

desc "First run model specs with coverage, then all specs, then jslint and finally all other metrics"
task :default => ["coverage:models", "coverage:all", "jslint", "metrics:all"]

namespace :coverage do
  desc "Run model specs with coverage"
  task :models do
    ENV["COVERAGE"] = "true"
    ENV["COVERAGE_DIR"] = "tmp/coverage/models"
    
    Rake::Task["spec:models"].invoke
    
    ENV["COVERAGE"] = "false"
    ENV["COVERAGE_DIR"] = ""
  end
  
  desc "Run all specs with coverage"
  task :all do
    ENV["COVERAGE"] = "true"
    ENV["COVERAGE_DIR"] = "tmp/coverage/all"
    
    Rake::Task["spec"].invoke
    
    ENV["COVERAGE"] = "false"
    ENV["COVERAGE_DIR"] = ""
  end
end