class ChatroomsController < ApplicationController
  before_action :set_chatroom, only: [:edit, :update]
  before_action :new_chatroom, only: [:index, :new, ]


  def index
    @chatrooms = Chatroom.all
  end

  def new
  end

  def edit
  end

  def create
    @chatroom = Chatroom.new(chatroom_params)
    if @chatroom.save
      flash[:info] = "new topic created"
      redirect_to @chatroom
    else
      flash[:warning] = 'A chatroom with this topic already exists'
      redirect_to new_chatroom_path
    end
  end

  def update
    @chatroom.update(chatroom_params)
    redirect_to @chatroom
  end

  def show
    # either via id or slug
    @chatroom =
      if params.has_key?(:id)
        Chatroom.find(params[:id])
      elsif  params.has_key?(:slug)
        Chatroom.find_by(topic: Chatroom.unslugify(params[:slug]))
      else
        raise ActionController::ParameterMissing, "expecting key :id ot :slug, found none"
      end
    @message = Message.new
  end

  private
  def new_chatroom
    @chatroom = Chatroom.new()
  end

  def set_chatroom
    @chatroom = Chatroom.find(chatroom_params)
  end

  def chatroom_params
    params.required(:chatroom).permit(:id, :topic, :slug)
  end
end
