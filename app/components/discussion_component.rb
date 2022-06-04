# frozen_string_literal: true

class DiscussionComponent < ViewComponent::Base
  def initialize(discussion:)
    @discussion = discussion
  end

end
