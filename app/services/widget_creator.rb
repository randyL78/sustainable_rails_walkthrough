class WidgetCreator
  def initialize(notifier:)
    @notifier = notifier
  end

  def create_widget(widget_params)
    widget = Widget.create(widget_params)

    if widget.valid?
      @notifier.notify(:widget, widget.id)
      # sales_tax_api.charge_tax(widget)
      Result.new(created: true, widget: widget)
    else
      Result.new(created: false, widget: widget)
    end
  end

  class Result
    attr_reader :widget

    def initialize(created:, widget: nil)
      @created = created
      @widget = widget
    end

    def created?
      @created
    end
  end

  private def sales_tax_api
    # @sales_tax_api = ThirdParty::Tax new
  end
end
