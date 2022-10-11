# frozen_string_literal: true

class DiscussionHeaderComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(discussion:)
    @discussion = discussion
  end
end
