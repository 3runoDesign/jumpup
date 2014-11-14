
module Jumpup
  class << self
    MISSING_INTEGRATION_TASKS_CONSTANT_MESSAGE = %{
    You should define INTEGRATION_TASKS constant. We recommend that you define it on lib/tasks/jumpup.rake file. The file doesn't exists. You should create it in your project.

    You'll probably want to add coverage/ to your .gitignore file.

    A sample content look like this:

    INTEGRATION_TASKS = %w(
      jumpup:start
      jumpup:bundle_install
      db:migrate
      spec
      jumpup:finish
    )

    }

    def perform_integration
      unless defined?(INTEGRATION_TASKS)
        Jumpup::UI.header MISSING_INTEGRATION_TASKS_CONSTANT_MESSAGE
        exit
      end

      invoke_tasks
    end

    def load_tasks
      Dir["#{Gem::Specification.find_by_name('jumpup').full_gem_path}/lib/tasks/*.rake"].each { |ext| load ext } if defined?(Rake)
    end

    private

    def invoke_tasks
      INTEGRATION_TASKS.each do |subtask|
        next if skip_spec?(subtask)
        Jumpup::UI.header("--> Executing #{subtask}...".white) do
          Rake::Task[subtask].invoke
        end
      end
    end

    def skip_spec?(task)
      task == 'spec' && ENV['SKIP_SPEC'] == '1'
    end
  end
end

Jumpup.load_tasks

require 'jumpup/ui'
require 'jumpup/commands'
