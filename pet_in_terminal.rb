class Pet
  def initialize(name)
    @name = name
    @asleep = false
    @awork = false
    @belly = 0
    @intestine = 0
    puts "Hello, my name is #{@name}. I am your new pet"
    @eat = ['banana', 'peach', 'orange', 'lime', 'strawberry', 'watermelon', 'cherry', 'mango', 'grapefruit']
    @random = @eat[rand(@eat.length)]
    @happy = 0
  end

  def feed
    puts "You cuts #{@random} and give piece to #{@name}."
    @happy = 5
    @belly = 10
    passage
    puts "\n(\\(\\\n(O.o)\nEAT\no_ _o\n "
  end

  def walk
    puts "\n(\\(\\ Lets play\n(^.^)\n(\")(\")____\n\\________/\n__O__O__\n "
    puts "You and #{@name} take your skate and go to walk."
    @happy = 10
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

  def sleep
    puts "\n(\\(\\   z Z\n(-.-) z Z\no_(\")(\")\n "
    puts "#{@name} is so tired and want to sleep."
    @asleep = true
    rand(24).times do
      if @asleep
        passage
      end
      if @asleep
        puts "z*rand(24)"
      end
    end
    if @asleep
      @asleep = false
      puts "#{@name} wake up and say 'Hello my friend!!!'"
    end
  end

  def work
    puts "\nLets work\n(\\(\\\n(O.O)\n====\n(\")(\")\n "
    @awork = true
    x = rand(24)
    x.times do
      if @awork
        passage
      end
    end
    puts "#{@name} go to work."
    if @awork
      @awork = false
      puts "After #{x} hours #{@name} decide to rest."
    end
  end

  private

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
        puts "#{@name} wake up and want to eat and play."
      end
      puts "#{@name} go to the kitchen and eat #{@random}."
      @belly = 5
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
      @happy = 2
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
    [200, {"Content-Type" => "text/html"}, ["test"]]
  end
end
