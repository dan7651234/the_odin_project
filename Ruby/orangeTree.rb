class OrangeTree
  #Requirements:
  #height method that returns the current height DONE
  #oneYearPasses method that does the following:
  # => ages the tree by one,
  # => increases the height
  # => resets the fruit count,
  # => then adds the new fruit amount.
  #countTheOranges method that returns amount of fruit on three
  #pickAnOrange method that does the following
  # => reduces the amount of fruit on tree by one if @fruit > 0
  # => returns a string saying how delicious the orange was



  def initialize
    @height = 1.0
    @age = 0
    @maxAge = 10 + rand(50)
    @orangeCount = 0
    @alive = true
  end

  def height
    @height
  end

  def alive
    @alive
  end

  def age
    @age
  end

  def countTheOranges
    @orangeCount
  end

  def oneYearPasses
    @orangeCount = 0
    @age = @age + 1
    if @age > @maxAge
      @alive = false
    end

    unless @alive
      return 'The tree is no longer alive'
    end

    @height = @height * 1.25

    if @age > 2
      @orangeCount = @age * rand(8)
    else
      @orangeCount = 0
    end
  end

  def pickAnOrange
    if @orangeCount > 0
      @orangeCount = @orangeCount - 1
      return 'This orange is so juicy and delicious!'
    else
      return 'There are no oranges left on the tree!'
    end
  end

end

tree1 = OrangeTree.new
while tree1.alive
  puts('Height is ' + tree1.height.to_s)
  puts('Age is ' + tree1.age.to_s)
  puts('Orange Count is ' + tree1.countTheOranges.to_s)
  tryToEat = tree1.pickAnOrange
  puts('Orange Count is ' + tree1.countTheOranges.to_s)
  puts(tryToEat)
  tree1.oneYearPasses
end
