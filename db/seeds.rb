# frozen_string_literal: true

initial_boards = [
  {
    category: 'general',
    boards: [
      'whatever'
    ]
  },
  {
    category: 'programming',
    boards: %w[
      python
      ruby
      lisp
    ]
  }
]

initial_boards.map do |initial_board|
  category = initial_board[:category]
  boards = initial_board[:boards]
  c = BoardCategory.find_or_create_by(name: category)
  boards.each do |board|
    Board.find_or_create_by(
      name: board, default_from_name: '774さん', board_category_id: c.id
    )
  end
end

unless Rails.env.production?
  board = Board.find_by(name: initial_boards.first[:boards].first)
  thread = Th.find_or_create_by(board_id: board.id, name: 'test!?!?!?')

  10.times do |i|
    comment = "test#{i}"
    Comment.create(th: thread, length: comment.length, body: comment, ip: "192.168.0.#{rand(1..256)}")
    sleep(rand(0.1..1))
  end
end
