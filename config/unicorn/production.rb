@app_path = "/var/www/html/webapp-tabimuse-rails"
working_directory @app_path + "/current"

worker_processes 2
preload_app true
timeout 301
listen "/tmp/unicorn.sock", :backlog => 64
pid "/var/www/html/webapp-tabimuse-rails/shared/tmp/pids/unicorn.pid"

stderr_path "#{@app_path}/current/log/unicorn.stderr.log"
stdout_path "#{@app_path}/current/log/unicorn.stdout.log"

# before_fork do |server, worker|
#   ENV['BUNDLE_GEMFILE'] = File.expand_path('Gemfile', ENV['RAILS_ROOT'])
# end

before_exec do |server, worker|
  ENV['BUNDLE_GEMFILE'] = @app_path + "/current/Gemfile"
end


before_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.connection.disconnect!
  end

  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  if defined?(ActiveRecord::Base)
    ActiveRecord::Base.establish_connection
  end
end
