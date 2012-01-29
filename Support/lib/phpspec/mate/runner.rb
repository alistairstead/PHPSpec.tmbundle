require 'stringio'
require 'cgi'

module PHPSpec
    module Mate
        class Runner
            def run_all(stdout, options={})
                options.merge!({:files => [project_directory]})
                run(stdout, options)
            end

            def run_files(stdout, options={})
                files = ENV['TM_SELECTED_FILES'].scan(/'(.*?)'/).flatten.map do |path|
                    File.expand_path(path)
                end
                options.merge!({:files => files})
                run(stdout, options)
            end

            def run_file(stdout, options={})
                options.merge!({:files => [single_file]})
                run(stdout, options)
            end

            def run_selected(stdout, options={})
                options.merge!({:files => [single_file], :example => ENV['TM_SELECTED_TEXT']})
                run(stdout, options)
            end

            def run(stdout, options)
                formatter = ENV['TM_PHPSPEC_FORMATTER'] || 'textmate'
                stderr = StringIO.new
                old_stderr = $stderr
                $stderr = stderr
                argv = options[:files].dup
                argv << '--formatter' << formatter
                if options[:example]
                    argv << '--example'
                    argv << options[:example]
                end
                Dir.chdir(project_directory) do
                    cmd = "phpspec"
                    args = argv.join(' ');
                    stdout << `#{cmd} #{args}`
                end
                rescue Exception => e
                    require 'pp'
                    stdout << "<h1>Uncaught Exception</h1>" <<
                    "<p>#{e.class}: #{e.message}</p>" <<
                    "<pre>" <<
                    CGI.escapeHTML(e.backtrace.join("\n  ")) <<
                    "</pre>" <<
                    "<h2>Options:</h2>" <<
                    "<pre>" <<
                    CGI.escapeHTML(PP.pp(options, '')) <<
                    "</pre>"
                ensure
                    unless stderr.string == ""
                    stdout << "<h2>stderr:</h2>" <<
                    "<pre>" << CGI.escapeHTML(stderr.string) << "</pre>"
                end
                $stderr = old_stderr
            end

            protected
            def single_file
                File.expand_path(ENV['TM_FILEPATH'])
            end

            def project_directory
                File.expand_path(ENV['TM_PROJECT_DIRECTORY']) rescue File.dirname(single_file)
            end
        end
    end
end