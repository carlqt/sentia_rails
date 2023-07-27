class PersonsController < ApplicationController
  def index
    @people = Person.all
  end
end
