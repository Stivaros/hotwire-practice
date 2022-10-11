# frozen_string_literal: true

class DiscussionFormComponent < ViewComponent::Base
  include Turbo::FramesHelper
  
  def initialize(discussion:)
    @discussion = discussion
  end

end
