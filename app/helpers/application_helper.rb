module ApplicationHelper
  def danger_alert(&block)
    content_tag :div, class: "rounded-md bg-red-50 p-4" do
      content_tag :div, class: "mt-2 text-md text-red-700" do
        yield if block_given?
      end
    end
  end

  def warning_alert(&block)
    content_tag :div, class: "rounded-md bg-yellow-50 p-4" do
      content_tag :div, class: "mt-2 text-md text-yellow-700" do
        yield if block_given?
      end
    end
  end

  def success_alert(&block)
    content_tag :div, class: "rounded-md bg-green-50 p-4" do
      content_tag :div, class: "mt-2 text-md text-green-700" do
        yield if block_given?
      end
    end
  end
end
