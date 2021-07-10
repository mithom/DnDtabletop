module Authenticated
  class CharactersController < AuthenticatedController

    # GET /users/characters
    def index
      authorize Character
      # TODO: fix n+1 problem here, problem with embedded eager loading
      # @characters = current_user.characters.includes(:character_class, from: :class_lvls)
      @characters = current_user.characters
    end

    # GET /users/characters/:id
    def show
      @character = authorize current_user.characters.find(params[:id])
    end

    # POST /users/characters
    def create

    end

    # GET /users/characters/new
    def new
      authorize Character
    end

    # GET /users/characters/:id/edit
    def edit

    end

    # PATCH/PUT /users/characters/:id
    def update

    end

    # DELETE /users/characters/:id
    def destroy

    end
  end
end
