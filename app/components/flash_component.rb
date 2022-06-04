# frozen_string_literal: true

class FlashComponent < ViewComponent::Base
  def initialize(type:, data:)
    @type = type
    @data = data
  end

  def css_classes
    case @type
    when "notice"
      "alert alert-info"
    when "alert"
      "alert alert-warning"
    end 
  end
end
