# frozen_string_literal: true

module HttpConcern

  # Handle not found status
  def not_found(model_name)
    render json: { error: "#{model_name} not found" }, status: :not_found
  end

  # Render server responserou
  def render_response(identifier, data, serializer, status = :ok)
    render json: {
      "#{identifier}": serialize_obj(serializer, data)
    }, status: status
  end

  # Render error response
  def render_error_response(errors, status = :unprocessable_entity)
    render json: { errors: errors }, status: status
  end
end