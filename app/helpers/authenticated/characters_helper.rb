module Authenticated
  module CharactersHelper

    def class_lvl_string(class_lvl)
      CharacterClass.find(class_lvl[:class]).name + ': ' + class_lvl[:lvl].to_s
    end

    def class_lvl_strings(character)
      character.lvl.collect { |class_lvl| class_lvl_string class_lvl }
    end

    def classes_string(character)
      #de classes worden hier verder niet ingeladen, dus pluck is efficiënter
      character.character_classes.pluck(:name).join(' + ')
    end

  end
end
