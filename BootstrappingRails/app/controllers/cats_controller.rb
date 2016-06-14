class CatsController < ApplicationController
  class Cat
    attr_accessor :name, :description
    def initialize(name, description)
      @name = name
      @description = description
    end
    def id
      name.parameterize
    end
  end

  def list
    @cats = fetch_cats
  end
  def detail
    @cats = fetch_cats
    @cat = @cats.find { |cat| cat.id == params[:id]}
  end
  def fetch_cats
    catman = Cat.new "Cat Man", "He looks kinda weird, but really loves you"
    bigcat = Cat.new "The Big One", "13lbs of floof! He doesn't really care much, but is nice"
    return [
      catman,
      bigcat
    ]
  end
end
