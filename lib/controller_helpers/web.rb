module ControllerHelpers::Web

  def self.included(base)
    base.class_eval do
      helper_method :title
    end
  end

  private

  def title(part = nil)
    @parts ||= []
    unless part
      return nil if @parts.blank?
      return @parts.reverse.join('. ')
    end
    @parts << part
  end
end
