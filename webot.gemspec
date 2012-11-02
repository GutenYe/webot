Kernel.load File.expand_path("../lib/webot/version.rb", __FILE__)

Gem::Specification.new do |s|
	s.name = "webot"
	s.version = Webot::VERSION
  s.summary = "webot"
	s.description = <<-EOF
webot
	EOF

	s.author = "Guten"
	s.email = "ywzhaifei@gmail.com"
	s.homepage = "http://github.com/GutenYe/webot"
	s.rubyforge_project = "xx"

	s.files = `git ls-files`.split("\n")
  s.executables = ["webot"]
end
