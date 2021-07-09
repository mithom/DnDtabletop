module Constants
  # This is a constant because it is all capitals
  PROFICIENCY_BONUS = [2, 2, 2, 2, 3, 3, 3, 3, 4, 4, 4, 4, 5, 5, 5, 5, 6, 6, 6, 6].freeze

  module ArmorTypes
    HEAVY  = :heavy
    MEDIUM = :medium
    LIGHT  = :light

    ARMOR_TYPES = [HEAVY, MEDIUM, LIGHT].freeze
  end

  module WeaponClasses
    SIMPLE  = :simple
    MARTIAL = :martial

    WEAPON_CLASSES = [SIMPLE, MARTIAL].freeze
  end

  module WeaponTypes
    CLUB           = :club
    DAGGER         = :dagger
    GREAT_CLUB     = :great_club
    HAND_AXE       = :hand_axe
    JAVELIN        = :javelin
    LIGHT_HAMMER   = :light_hammer
    MACE           = :mace
    QUARTERSTAFF   = :quarterstaff
    SICKLE         = :sickle
    SPEAR          = :spear
    UNARMED_STRIKE = :unarmed_strike
    LIGHT_CROSSBOW = :light_crossbow
    DART           = :dart
    SHORT_BOW      = :short_bow
    SLING          = :sling
    BATTLE_AXE     = :battle_axe
    FLAIL          = :flail
    GLAIVE         = :glaive
    GREAT_AXE      = :great_axe
    GREAT_SWORD    = :great_sword
    HALBERT        = :halbert
    LANCE          = :lance
    LONGSWORD      = :longsword
    MAUL           = :maul
    MORNINGSTAR    = :morningstar
    PIKE           = :pike
    RAPIER         = :rapier
    SCIMITAR       = :scimitar
    SHORT_SWORD    = :short_sword
    TRIDENT        = :trident
    WAR_PICK       = :war_pick
    WAR_HAMMER     = :war_hammer
    WHIP           = :whip
    BLOWGUN        = :blowgun
    HAND_CROSSBOW  = :hand_crossbow
    HEAVY_CROSSBOW = :heavy_crossbow
    LONGBOW        = :longbow
    NET            = :net

    SIMPLE_WEAPON_TYPES = [CLUB, DAGGER, GREAT_CLUB, HAND_AXE, JAVELIN, LIGHT_HAMMER, MACE, QUARTERSTAFF,
                           SICKLE, SICKLE, UNARMED_STRIKE, LIGHT_CROSSBOW, DART, SHORT_BOW, SLING].freeze

    MARTIAL_WEAPON_TYPES = [BATTLE_AXE, FLAIL, GLAIVE, GREAT_AXE, GREAT_SWORD, HALBERT, LANCE, LONGSWORD,
                            MAUL, MORNINGSTAR, PIKE, RAPIER, SCIMITAR, SHORT_SWORD, TRIDENT, WAR_PICK,
                            WAR_HAMMER, WHIP, BLOWGUN, HAND_CROSSBOW, HEAVY_CROSSBOW, LONGBOW, NET].freeze

    WEAPON_TYPES = [CLUB, DAGGER, GREAT_CLUB, HAND_AXE, JAVELIN, LIGHT_HAMMER, MACE, QUARTERSTAFF,
                    SICKLE, SICKLE, UNARMED_STRIKE, LIGHT_CROSSBOW, DART, SHORT_BOW, SLING, BATTLE_AXE,
                    FLAIL, GLAIVE, GREAT_AXE, GREAT_SWORD, HALBERT, LANCE, LONGSWORD,
                    MAUL, MORNINGSTAR, PIKE, RAPIER, SCIMITAR, SHORT_SWORD, TRIDENT, WAR_PICK,
                    WAR_HAMMER, WHIP, BLOWGUN, HAND_CROSSBOW, HEAVY_CROSSBOW, LONGBOW, NET].freeze
  end

  # TODO: fill in magical damage types
  module DamageTypes
    BLUDGEONING = :bludgeoning
    PIERCING    = :piercing
    SLASHING    = :slashing

    PHYSICAL_DAMAGE_TYPES = [BLUDGEONING, PIERCING, SLASHING].freeze
    MAGICAL_DAMAGE_TYPES  = [].freeze
    DAMAGE_TYPES          = [BLUDGEONING, PIERCING, SLASHING].freeze
  end

  module ToolTypes
    ALCHEMISTS_SUPPLIES    = :alchemists_supplies
    BREWERS_SUPPLIES       = :brewers_supplies
    CALLIGRAPHERS_SUPPLIES = :calligraphers_supplies
    CARPENTERS_TOOLS       = :carpenters_tools
    CARTOGRAPHERS_TOOLS    = :cartographers_tools
    COBBLERS_TOOLS         = :cobblers_tools
    COOKS_UTENSILS         = :cooks_utensils
    GLASSBLOWERS_TOOLS     = :glassblowers_tools
    JEWELERS_TOOLS         = :jewelers_tools
    LEATHERWORKERS_TOOLS   = :leatherworkers_tools
    MASONS_TOOLS           = :masons_tools
    PAINTERS_SUPPLIES      = :painter_supplies
    POTTERS_TOOLS          = :potters_tools
    SMITHS_TOOLS           = :smiths_tools
    TINKERS_TOOLS          = :tinkers_tools
    WEAVERS_TOOLS          = :weavers_tools
    WOODCARVERS_TOOLS      = :woodcarvers_tools
    DISGUISE_KIT           = :disguise_kit
    FORGERY_KIT            = :forgery_kit
    DICE_SET               = :dice_set
    DRAGONCHESS_SET        = :dragonchess_set
    PLAYING_CARD_SET       = :playing_card_set
    THREE_DRAGON_ANTE_SET  = :three_dragon_ante_set
    HERBALISM_KIT          = :herbalism_kit
    BAGPIPES               = :bagpipes
    DRUM                   = :drum
    DULCIMER               = :dulcimer
    FLUTE                  = :flute
    LUTE                   = :lute
    LYRE                   = :lyre
    HORN                   = :horn
    PAN_FLUTE              = :pan_flute
    SHAWN                  = :shawn
    VIOL                   = :viol
    NAVIGATORS_TOOLS       = :navigators_tools
    POISONERS_KIT          = :poisoners_kit
    THIEVES_TOOLS          = :thieves_tools

    ARTISANS_TOOL_TYPES = [ALCHEMISTS_SUPPLIES, BREWERS_SUPPLIES, CALLIGRAPHERS_SUPPLIES, CARPENTERS_TOOLS,
                           CARTOGRAPHERS_TOOLS, COBBLERS_TOOLS, COOKS_UTENSILS, GLASSBLOWERS_TOOLS, JEWELERS_TOOLS,
                           LEATHERWORKERS_TOOLS, MASONS_TOOLS, PAINTERS_SUPPLIES, POTTERS_TOOLS, SMITHS_TOOLS, TINKERS_TOOLS,
                           WEAVERS_TOOLS, WOODCARVERS_TOOLS].freeze

    GAMING_SET_TYPES = [DICE_SET, DRAGONCHESS_SET, PLAYING_CARD_SET, THREE_DRAGON_ANTE_SET].freeze

    MUSICAL_INSTRUMENT_TYPES = [BAGPIPES, DRUM, DULCIMER, FLUTE, LUTE, LYRE, HORN, PAN_FLUTE, SHAWN, VIOL].freeze

    TOOL_TYPES = [ALCHEMISTS_SUPPLIES, BREWERS_SUPPLIES, CALLIGRAPHERS_SUPPLIES, CARPENTERS_TOOLS,
                  CARTOGRAPHERS_TOOLS, COBBLERS_TOOLS, COOKS_UTENSILS, GLASSBLOWERS_TOOLS, JEWELERS_TOOLS,
                  LEATHERWORKERS_TOOLS, MASONS_TOOLS, PAINTERS_SUPPLIES, POTTERS_TOOLS, SMITHS_TOOLS, TINKERS_TOOLS,
                  WEAVERS_TOOLS, WOODCARVERS_TOOLS, DICE_SET, DRAGONCHESS_SET, PLAYING_CARD_SET, THREE_DRAGON_ANTE_SET,
                  BAGPIPES, DRUM, DULCIMER, FLUTE, LUTE, LYRE, HORN, PAN_FLUTE, SHAWN, VIOL, DISGUISE_KIT, FORGERY_KIT,
                  HERBALISM_KIT, NAVIGATORS_TOOLS, POISONERS_KIT, THIEVES_TOOLS].freeze
  end
end
