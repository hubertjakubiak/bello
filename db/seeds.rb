board = Board.create(title: "Hubert")
list = List.create(title: "Korki", board_id: board.id)
10.times {|x| Card.create(body: "treść #{x}", list_id: list.id) }

board = Board.create(title: "Marek")
list = List.create(title: "Zakupy", board_id: board.id)
10.times {|x| Card.create(body: "treść #{x}", list_id: list.id) }

puts "Seeds were created..."