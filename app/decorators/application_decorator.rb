class ApplicationDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginatingDecorator
  end

  def pretty_date
    object.created_at.strftime('%a %d/%m/%y')
  end
end
