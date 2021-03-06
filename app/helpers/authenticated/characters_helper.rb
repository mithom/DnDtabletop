module Authenticated
  module CharactersHelper
    def class_lvl_string(class_lvl)
      class_lvl.character_class.name + ': ' + class_lvl.lvl.to_s
    end

    def class_lvl_strings(character)
      character.character_class_lvls.collect { |class_lvl| class_lvl_string class_lvl }
    end

    def classes_string(character)
      character.character_class_lvls.collect do |class_lvl|
        class_lvl.character_class.name
      end.join(' + ')
    end
  end
end
