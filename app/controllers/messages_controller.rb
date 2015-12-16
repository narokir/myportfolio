class MessagesController < ApplicationController
	
	def new
		@message = Message.new
	end

	def create
		@message = Message.new(params[:message])
    @message.request = request
    
    respond_to do |format|
      if @message.deliver
        format.html {}
        format.js { flash.now[:notice] = 'OK! Your message was sent.'}
      else
        format.html {}
        format.js { flash.now[:error] = "Can't send this message. Something is missing."}
      end
    end
  end
end
