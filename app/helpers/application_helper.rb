module ApplicationHelper
  def message_for_number(number, tag = :h1)
    result = number > 3 ? 'veci' : 'manji'
    content_tag tag.to_sym, "Broj je #{result} od 3"
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
