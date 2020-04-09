class Notification
  attr_reader :topic, :message

  def initialize(topic, message = nil)
    @topic = topic
    @message = message
  end

  def to_s
    "#{topic} #{message}"
  end
end
