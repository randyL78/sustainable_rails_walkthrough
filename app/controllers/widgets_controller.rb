class WidgetsController < ApplicationController

  def new
    @widget = Widget.new
    @widget.errors[:name] << "can't be blank"
    @widget.errors[:manufacturer_id] << "can't be blank"
    @widget.errors[:price_cents] << "is not a number"
    @manufacturers = Manufacturer.all
  end

  def create
    render plain: "Thanks"
  end

  def show
    manufacturer = OpenStruct.new(
      id: rand(100),
      name: "Sector 7G",
      address: OpenStruct.new(
        id: rand(100),
        country: "UK"
      )
    )

    widget_name = if params[:id].to_i == 1234
                    "Stembolt"
                  else
                    "Widget #{params[:id]}"
                  end

    widget = OpenStruct.new(
      id: params[:id],
      manufacturer_id: manufacturer.id,
      manufacturer: manufacturer,
      name: widget_name
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
      OpenStruct.new(id: 1234, name: "Stembolt"),
      OpenStruct.new(id: 2, name: "Flux Capacitor")
    ]
  end
end
