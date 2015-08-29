Given(/^the server is running$/) do
  path = File.join(Rails.root, 'tmp', 'pids', 'server.pid')
  pid = File.read(path).to_i
  server_running = true

  # checks for presence of pid - only present when server is running
  begin
    Process.getpgid pid
  rescue Errno::ESRCH
    server_running = false
  end

  expect(server_running).to be_true
end
