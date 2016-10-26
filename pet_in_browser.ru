class Pet
   # this is 'class vaiable'
  # template to share it among all pages (do not repeat yourself) ;)
  def initialize(name)
    @name = name
    @asleep = false
    @awork = false
    @belly = 10
    @intestine = 0
    @happy = 10
  end

  @@eat_pet = "<br>" +
  "<p>(\\(\\<br>" +
  "(O.o)<br>" +
  " EAT <br>" +
  "o_ _o</p>"

  @@sleep_pet = "<br>" +
  "<p>(\\(\\   z Z<br>" +
  "(-.-) z Z<br>" +
  "o_(\")(\")</p>"

  @@happy_pet = "<br>" +
  "<p>(\\(\\This is good<br>" +
  "(^.^)/***\\<br>" +
  "o_______(\")(\")</p>"

  @@walk_pet = "<br>" +
  "<p>(\\(\\<br>" +
  "(^.^)<br>" +
  "(\")(\")_____<br>" +
  "\\________/<br>" +
  "__O__O__</p>"

  @@work_pet = "<br>" +
  "<p>Lets work<br>" +
  "(\\(\\<br>" +
  "(O.O)<br>" +
  "====<br>" +
  "(\")(\")</p>"

  @@restroom_pet = "<br>" +
  "(\\(\\<br>" +
  "(O.O)<br>" +
  "o_(\")(\")<br>" +
  ">>ROCKET>"

  def feed
    @eat = ['banana', 'peach', 'orange', 'lime', 'strawberry', 'watermelon', 'cherry', 'mango', 'grapefruit']
    @random = @eat[rand(@eat.length)]
    @random_fruit = "You cuts #{@random} and give piece to #{@name}."
    puts @random_fruit
    @happy = @happy + 2
    @belly = @belly + 2
    passage
    puts "\n(\\(\\\n(O.o)\nEAT\no_ _o\n "
  end

  def walk
    puts "\n(\\(\\ Lets play\n(^.^)\n(\")(\")____\n\\________/\n__O__O__\n "
    @walk_with_you = "You and #{@name} take your skate and go to walk."
    puts @walk_with_you
    @happy = @happy + 2
    passage
  end

  def happy
    puts "\n(\\(\\This is good\n(^.^)/***\\\no_______(\")(\")\n "
    puts "#{@name} smile."
    if @happy > 5
      puts "#{@name} is happy."
    else
      puts "#{@name} want to play."
    end
  end

  def dream
    puts "\n(\\(\\   z Z\n(-.-) z Z\no_(\")(\")\n "
    @want_sleep = "#{@name} is so tired and want to sleep."
    @asleep = true
    c = rand(20) + 1
    @sleep_hours = "After #{c} hours #{@name} wake up."
    c.times do
      if @asleep
        passage
      end
      if @asleep
        puts "z " * c
      end
    end
    puts @want_sleep
    if @asleep
      @asleep = false
      puts @sleep_hours
    end
  end

  def work
    puts "\nLets work\n(\\(\\\n(O.O)\n====\n(\")(\")\n"
    @awork = true
    x = rand(24) + 1
    x.times do
      if @awork
        passage
      end
    end
    puts "#{@name} go to work."
    if @awork
      @awork = false
      @work_hours = "After #{x} hours #{@name} decide to rest."
      puts @work_hours
    end
  end

  def restroom
    @intestine = 0
    passage
  end

  def hungry?
    @belly <= 2
  end

  def poopy?
    @intestine >= 8
  end

  def passage
    if @belly > 0
      @belly = @belly - 1
      @happy = @happy - 1
      @intestine = @intestine + 1
    else
      if @asleep
        @asleep = false
        puts @sleep_hours
        puts "#{@name} wake up and want to eat and play."
      end
      puts "#{@name} go to the kitchen and eat #{@random}."
      @belly = @belly + 1
    end

    if @intestine >= 10
      @intestine = 0
      puts "#{@name} on the rocket go the restroom."
    end

    if hungry?
      if @asleep
        @asleep = false
        puts "#{@name} wake up and want to eat."
      end
      puts "Hey I want to eat."
      @happy = @happy + 1
    end

    if poopy?
      if @asleep
        @asleep = false
        puts "#{@name} wake up."
      end
      puts "#{@name} see the restroom and think where is my rocket."
    end
  end

  def call(env)
    @@pet_status = "<hr><p>belly:#{@belly}</p><hr><p>happy:#{@happy}</p><hr><p>intestine:#{@intestine}</p><hr>"
    req = Rack::Request.new(env)
    case req.path_info
    when /feed/
      feed
      # do something with your Pet
      # store updated data to file || table || database || session
      # and render to the web:
      [200, {"Content-Type" => "text/html"}, ["<h1>I want to eat</h1><h2>#{@random_fruit}</h2>#{@@eat_pet}#{@@pet_status}"]]
    when /dream/
      dream
      [200, {"Content-Type" => "text/html"}, ["<h1>#{@want_sleep}</h1><h2>#{@sleep_hours}</h2>#{@@sleep_pet}#{@@pet_status}"]]
    when /work/
      work
      [200, {"Content-Type" => "text/html"}, ["<h1>I have some work</h1><h2>#{@work_hours}</h2>#{@@work_pet}#{@@pet_status}"]]
    when /happy/
      happy
      [200, {"Content-Type" => "text/html"}, ["<h1>I'm so HAPPY</h1>#{@@happy_pet}#{@@pet_status}"]]
    when /walk/
      walk
      [200, {"Content-Type" => "text/html"}, ["<h1>Lets go to the park</h1><h2>#{@walk_with_you}</h2>#{@@walk_pet}#{@@pet_status}"]]
    when /restroom/
      restroom
      [200, {"Content-Type" => "text/html"}, ["<h1>#{@name} go to the restroom</h1>#{@@restroom_pet}#{@@pet_status}"]]
    else
      [404, {"Content-Type" => "text/html"}, ["<h1>Hello! I'm a your new friend. My name is #{@name}.</h1><br><ul><li><a href = \"/feed\">I want to eat</a></li><li><a href = \"/work\">I have some work</a></li><li><a href = \"/happy\">I'm so happy</a></li><li><a href = \"/walk\">I want to walk</a></li><li><a href = \"/dream\">I want to sleep</a></li><li><a href = \"/restroom\">WC</a></li></ul>"]]
    end
  end
end

# to run server 'rackup config.ru' in terminal

run Pet.new("Rabbit")
