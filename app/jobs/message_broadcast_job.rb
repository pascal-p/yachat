class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(msg)
    ActionCable.server.broadcast(
      'messages',
      message: render_(msg)
    )
  end

  private
  def render_(msg)
    ApplicationController.renderer.render(partial: 'messages/message',
                                          locals: {message: msg})
  end
end
