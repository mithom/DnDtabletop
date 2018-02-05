module Authenticated
  class CharactersController < AuthenticatedController

    def index
      authorize Character
      # TODO: fix n+1 problem here, problem with embedded eager loading
      # @characters = current_user.characters.includes(:character_class, from: :class_lvls)
      @characters = current_user.characters
      skip_policy_scope  #if we have admins, we can expand this to other users etc.
    end

    def show
      @character = authorize current_user.characters.find(params[:id])
      skip_policy_scope
    end

  end

end
