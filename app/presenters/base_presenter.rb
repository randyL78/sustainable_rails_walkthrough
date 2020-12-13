class BasePresenter
  include ActionView::Helpers::TagHelper

  delegate_missing_to :@model

  def initialize(model)
    @model = model
  end

  attr_reader :model
end
