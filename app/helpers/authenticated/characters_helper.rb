module Authenticated
  module CharactersHelper

    def class_lvl_string(class_lvl)
     class_lvl.character_class.pluck(:name).first + ': ' + class_lvl.lvl.to_s
    end

    def class_lvl_strings(character)
      character.class_lvls.collect { |class_lvl| class_lvl_string class_lvl }
    end

    def classes_string(character)
      #de classes worden hier verder niet ingeladen, dus pluck is efficiënter
      character.class_lvls.all.collect { |class_lvl| class_lvl.character_class.pluck(:name).first }.join(' + ')
    end

  end
end
