class WidgetsController < ApplicationController

  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "UK"
      )
    )

    widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      manufacturer: manufacturer,
      name: "Widget #{params[:id]}"
    )

    def widget.widget_id
      if id.to_s.length < 3
        id.to_s
      else
        id.to_s[0..-3] + "." + id.to_s[-2..-1]
      end
    end

    @widget_presenter = WidgetPresenter.new(widget)
  end

  def index
    @widgets = [
      OpenStruct.new(id: 1, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor")
    ]
  end
end