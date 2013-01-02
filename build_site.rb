page = File.open("coolest_carrots.html", 'w')

header_template = File.open("templates/header.html", 'r').read
user_template = File.open("templates/user.html", 'r').read
footer_template = File.open("templates/footer.html", 'r').read

page.puts header_template
Dir.chdir("profiles")
Dir.glob("*.txt").each do |file|
  name = file.gsub(/\.txt/, "").capitalize
  avatar = Dir.glob("avatars/#{name.downcase}.*").first
  File.open(file, "r") {|f|
    page.puts user_template.gsub(/NAME/, name).gsub(/PROFILE/, f.read).gsub(/AVATAR/, avatar)
  }
end
page.puts footer_template

Dir.chdir("..")
`open coolest_carrots.html`
