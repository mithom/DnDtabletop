module Items
  class Tool < Item
    include Mongoid::Enum
    include Constants::ToolTypes

    enum :tool_type, TOOL_TYPES, default: ''
  end
end
