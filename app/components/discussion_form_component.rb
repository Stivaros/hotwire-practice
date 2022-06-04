# frozen_string_literal: true

class DiscussionFormComponent < ViewComponent::Base
  def initialize(discussion:)
    @discussion = discussion
  end

end
