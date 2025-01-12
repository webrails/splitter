class NullObject

  def method_missing(*) = self

  def respond_to_missing?(*) = true

  def nil? = true

  def ! = true

end
