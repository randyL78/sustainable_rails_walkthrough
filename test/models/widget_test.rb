require 'test_helper'

class WidgetTest < ActiveSupport::TestCase
  setup do
    @widget = FactoryBot.create(:widget)
  end

  test "valid prices do not trigger the DB constraint" do
    assert_nothing_raised do
      @widget.update_column(:price_cents, 450_00)
    end
  end

  test "negative prices do trigger the DB constraint" do
    ex = assert_raises do
      @widget.update_column(:price_cents, -10_00)
    end
    assert_match(/price_must_be_positive/i, ex.message)
  end

  test "when the name is an empty string, it's normalized to nil" do
    widget = Widget.new(name: "")
    widget.validate
    assert_nil widget.name
  end

  test "when name is just a bunch of spaces, it's normalized to nil" do
    widget = Widget.new(name: "     ")
    widget.validate
    assert_nil widget.name
  end
end
