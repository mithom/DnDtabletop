class Effect
  include Mongoid::Document

  # Implement this in code instea of db maybe?
  field :effect_function, type: String
  # Executing data as a function is very sensitive.
  attr_readonly :effect_function

  field :effect_node, type: String

  embedded_in :effectable, polymorphic: true
end
