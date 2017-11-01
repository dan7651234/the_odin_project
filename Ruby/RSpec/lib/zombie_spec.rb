require "spec_helper"
require "Zombie"
describe Zombie do
  it "is named Ash"
  zombie = Zombie.new
  zombie.name.should =='Ash'
end
