class CollaboratorsController < ApplicationController
  
  def index
    @collaborators = Collaborator.all
  end

end