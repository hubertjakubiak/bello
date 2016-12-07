module Api
  module V1
    class BoardsController < ApiController
      def index
        # @boards = Board.all
        render json: {errors: true}, status: 422
        # render json: @boards, each_serializer: BoardSerializer
      end

      def create
        @board  = Board.new(board_params)

        if @board.save
          render json: :ok
        else
          render json: {errors: @board.errors}, status: 422
        end
      end

      def show
        @board = Board.find(params[:id])

        render json: @board, serializer: BoardSerializer
      end
    end
  end
end