
class Pet
   # this is 'class vaiable'
  # template to share it among all pages (do not repeat yourself) ;)

   @@eatPet = "<br>" +
    "<p>(\\(\\<br>" +
    "(O.o)<br>" +
    " EAT <br>" +
    "o_ _o</p>"

    @@sleepPet = "<br>" +
     "<p>(\\(\\   z Z<br>" +
     "(-.-) z Z<br>" +
     "o_(\")(\")</p>"

    @@happyPet = "<br>" +
     "<p>(\\(\\This is good<br>" +
    "(^.^)/***\\<br>" +
     "o_______(\")(\")</p>"

    @@walkPet = "<br>" +
     "<p>(\\(\\ Lets play<br>" +
     "(^.^)<br>" +
    "(\")(\")_____<br>" +
    "\\________/<br>" +
    "__O__O__</p>"

    @@workPet = "<br>" +
     "<p>Lets work<br>" +
     "(\\(\\<br>" +
     "(O.O)<br>" +
     "====<br>" +
     "(\")(\")</p>"

  def call(env)
    req = Rack::Request.new(env)
    case req.path_info
    when /feed/
      # do something with your Pet
      # store updated data to file || table || database || session
      # and render to the web:
      [200, {"Content-Type" => "text/html"}, ["<h1>I want to eat</h1>#{@@eatPet}"]]
    when /work/
      [200, {"Content-Type" => "text/html"}, ["<h1>I have some work</h1>#{@@workPet}"]]
    when /happy/
      [200, {"Content-Type" => "text/html"}, ["<h1>I'm so HAPPY</h1>#{@@happyPet}"]]
    when /walk/
      [200, {"Content-Type" => "text/html"}, ["<h1>Lets go to the park</h1>#{@@walkPet}"]]
    when /sleep/
      [200, {"Content-Type" => "text/html"}, ["<h1>I want to sleep</h1>#{@@sleepPet}"]]
    else
      [404, {"Content-Type" => "text/html"}, ["<h1>Hello! I'm a your new friend. My name is Rabbit. </h1><br><ul><li><a href = \"/feed\">I want to eat</a></li><li><a href = \"/work\">I have some work</a></li><li><a href = \"/happy\">I'm so happy</a></li><li><a href = \"/walk\">I want to walk</a></li><li><a href = \"/sleep\">I want to sleep</a></li></ul>"]]
    end
  end
end
run Pet.new
# to run server 'rackup config.ru' in terminal
