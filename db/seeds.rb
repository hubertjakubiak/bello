user = User.create!(name: 'Hubert', email: 'hubert.jakubiak@gmail.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
10.times { |book| Board.create!(title: "Board ##{book}", owner_id: user.id)}
another_user = User.create!(name: 'Marek', email: 'test@example.com', password: 'asdfasdf', password_confirmation: 'asdfasdf')
10.times { |book| Board.create!(title: "Board ##{book}", owner_id: another_user.id)}
