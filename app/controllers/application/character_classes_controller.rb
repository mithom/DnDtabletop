module Application
  class CharacterClassesController < ApplicationController

    def index
      @character_classes = CharacterClass.all
    end

    def show
      @character_class = CharacterClass.find(params[:id])
    end

  end
end
