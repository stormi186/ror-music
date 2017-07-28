module ApplicationHelper
  def display_flash(type)
    if flash[type]
      content_tag :div, nil, class: 'alert alert-success' do
        content_tag :p, flash[type]
      end
    end
  end

  def error_for(attribute, errors, &block)
    if errors[attribute].any?
      content_tag :p, nil, class: 'validation-error' do
        yield("#{parse_attribute(attribute)} #{errors[attribute][0]}") if block_given?
        "#{parse_attribute(attribute)} #{errors[attribute][0]}"
      end
    end
  end

  def parse_attribute(attribute)
    attribute.to_s.capitalize.split('_').join(' ')
  end

  def count_for(model, message = 'Count')
    content_tag :h2, "#{message} #{model.count}"
  end

  def count_tracks_for(model)
  	model.products.count
  end
end
