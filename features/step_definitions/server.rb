Given(/^the server is running$/) do

	path = File.join(Rails.root, "tmp", "pids", "server.pid")
	pid = File.read(path).to_i
	server_running = true

	begin
	  Process.getpgid pid # checks for presence of pid - only present when server is running
	rescue Errno::ESRCH
	  server_running = false
	end

	expect(server_running).to be_true
end


When(/^I open the page with url '(.*?)'$/) do |url|
#	Capybara.default_driver = :selenium
	Capybara.default_driver = :poltergeist
	visit url
end