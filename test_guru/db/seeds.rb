# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
categories = Category.create! ([
  { title: 'Ruby' },
  { title: 'Python' },
  { title: 'Frameworks' }
])


tests = Test.create! ([
  { title: 'Введение в Ruby', level: 0, category_id: categories[0].id },
  { title: 'Введение в Python', level: 0, category_id: categories[1].id },
  { title: 'Python Machine Learning', level: 3, category_id: categories[1].id },
  { title: 'Vert.x Framework', level: 3, category_id: categories[2].id },
  ])

questions = Question.create! ([
  { body: 'Создатель языка Руби?', test_id: tests[0].id },
  { body: 'Что за документ - PEP8?', test_id: tests[1].id },
  { body: 'Django - MVC or MVVM', test_id: tests[1].id },
  { body: 'Что такое kNN?', test_id: tests[1].id },
  { body: 'Что такое Vert.x?', test_id: tests[2].id },
  ])

answers = Answer.create! ([
  { body: 'Юкихиро Мацумото', correct: true, question_id: questions[0].id },
  { body: 'Расмус Лердорф', correct: false, question_id: questions[0].id },
  { body: 'MVC', correct: true, question_id: questions[1].id },
  { body: 'MVVM?', correct: false, question_id: questions[1].id },
  { body: 'Vert.x это событийно-ориентированный фреймворк работающий на JVM', correct: true, question_id: questions[2].id },
  { body: 'Бесплатный веб-фреймворк PHP с открытым кодом, предназначенный для разработки с использованием архитектурной модели MVC', correct: false, question_id: questions[2].id },
  { body: 'Алгоритм k-ближайших соседей', correct: true, question_id: questions[3].id },
  { body: 'Это интегрированная среда разработки и обучения на языке Python, созданная с помощью библиотеки Tkinter', correct: false, question_id: questions[3].id },
  { body: 'Этот документ описывает соглашение о том, как писать код для языка python, включая стандартную библиотеку, входящую в состав python.', correct: true,  question_id: questions[4].id },
  { body: 'Это распространённый стандарт кодирования текста, позволяющий более компактно хранить и передавать символы Юникода', correct: false, question_id: questions[4].id },
  ])

users = User.create! ([
  { name: 'Ivan', email: 'ivan@mail.com' },
  { name: 'Andrei', email: 'andrei@mgail.com' },
  { name: 'Oxford', email: 'oxford@outlook.com' }
  ])

user_tests = UserTest.create! ([
  { passed: true, user_id: users[0].id, test_id: tests[0].id },
  { passed: false, user_id: users[0].id, test_id: tests[3].id },
  { passed: true, user_id: users[1].id, test_id: tests[2].id }
  ])

test_authors = TestAuthor.create! ([
  {user_id: users[0].id,  test_id: tests[0].id},
  {user_id: users[1].id, test_id: tests[0].id}
  ])
