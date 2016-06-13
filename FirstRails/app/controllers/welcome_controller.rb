class WelcomeController < ApplicationController
  def valid_lorem_types
    [
      'batman',
      'hipster'
    ]
  end
  def lorem
    type = params[:type]
    @lorem_text = valid_lorem_types.find { |i| i == type}
    if @lorem_text.present?
      case type
      when 'batman'
        @lorem_text = "Batman kills bad guys"
      when 'hipster'
        @lorem_text = "Coffee Relcaimed Matcha"
      end
    else
      render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found
    end
  end
end
