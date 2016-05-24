class ApplicationDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginatingDecorator
  end

  def pretty_date
    object.created_at.strftime("%a %m/%d/%y")
  end
end
