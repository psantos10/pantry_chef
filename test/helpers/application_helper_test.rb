require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "danger_alert renders correctly" do
    result = danger_alert { "This is a danger alert" }

    assert_includes result, "rounded-md bg-red-50 p-4"
    assert_includes result, "mt-2 text-md text-red-700"
    assert_includes result, "This is a danger alert"
  end

  test "warning_alert renders correctly" do
    result = warning_alert { "This is a warning alert" }

    assert_includes result, "rounded-md bg-yellow-50 p-4"
    assert_includes result, "mt-2 text-md text-yellow-700"
    assert_includes result, "This is a warning alert"
  end

  test "success_alert renders correctly" do
    result = success_alert { "This is a success alert" }

    assert_includes result, "rounded-md bg-green-50 p-4"
    assert_includes result, "mt-2 text-md text-green-700"
    assert_includes result, "This is a success alert"
  end
end
