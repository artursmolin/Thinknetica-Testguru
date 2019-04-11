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

users = User.create! ([
  { name: 'Иван', email: 'ivan@mail.com' },
  { name: 'Андрей', email: 'andrei@mgail.com' },
  { name: 'Оксфорд', email: 'oxford@outlook.com' }
  ])


tests = Test.create! ([
  { title: 'Введение в Ruby', level: 0, category: categories[0], author: users[0] },
  { title: 'Введение в Python', level: 0, category: categories[1], author: users[0] },
  { title: 'Python Machine Learning', level: 3, category: categories[1], author: users[0] },
  { title: 'Vert.x Framework', level: 3, category: categories[2], author: users[1] },
  ])

questions = Question.create! ([
  { body: 'Создатель языка Руби?', test: tests[0] },
  { body: 'Что за документ - PEP8?', test: tests[1] },
  { body: 'Django - MVC or MVVM', test: tests[1] },
  { body: 'Что такое kNN?', test: tests[1] },
  { body: 'Что такое Vert.x?', test: tests[2] },
  ])

answers = Answer.create! ([
  { body: 'Юкихиро Мацумото', correct: true, question: questions[0] },
  { body: 'Расмус Лердорф', correct: false, question: questions[0] },
  { body: 'MVC', correct: true, question: questions[1] },
  { body: 'MVVM?', correct: false, question: questions[1] },
  { body: 'Vert.x это событийно-ориентированный фреймворк работающий на JVM', correct: true, question: questions[2]},
  { body: 'Бесплатный веб-фреймворк PHP с открытым кодом, предназначенный для разработки с использованием архитектурной модели MVC', correct: false, question: questions[2] },
  { body: 'Алгоритм k-ближайших соседей', correct: true, question: questions[3] },
  { body: 'Это интегрированная среда разработки и обучения на языке Python, созданная с помощью библиотеки Tkinter', correct: false, question: questions[3] },
  { body: 'Этот документ описывает соглашение о том, как писать код для языка python, включая стандартную библиотеку, входящую в состав python.', correct: true,  question: questions[4] },
  { body: 'Это распространённый стандарт кодирования текста, позволяющий более компактно хранить и передавать символы Юникода', correct: false, question: questions[4] },
  ])


user_tests = UserTest.create! ([
  { passed: true, user: users[0] , test: tests[0] },
  { passed: false, user: users[0] , test: tests[3] },
  { passed: true, user: users[1] , test: tests[2] }
  ])
