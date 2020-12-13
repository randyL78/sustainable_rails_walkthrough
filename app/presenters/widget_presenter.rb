class WidgetPresenter < BasePresenter
  alias_method :widget, :model

  def styled_widget_id
    content_tag(:span, widget.id, style: "font-family: monospace")
  end
end
