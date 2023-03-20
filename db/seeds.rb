users = User.create([
  { name: "Asgor", email: "my_email@mail.com" },
  { name: "Asmos", email: "my_email@mail.ru" } ])

categories = Category.create([
  { title: 'Ruby' },
  { title: 'HTML' },
  { title: 'Python' } ])

tests = Test.create([
  { title: 'Control Flow',                        category_id: categories[0].id, author_id: users[0].id },
  { title: 'Metaprogramming',           level: 3, category_id: categories[0].id, author_id: users[0].id },
  { title: 'Text formatting',                     category_id: categories[1].id, author_id: users[0].id },
  { title: 'Dictionaries',              level: 2, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Blocs, Procs, and Lambdas', level: 2, category_id: categories[0].id, author_id: users[0].id } ])

questions = Question.create([
  { body: 'Is ternary operator applicable in Ruby?',       test_id: tests[0].id },
  { body: 'Could eval perform any string?',                test_id: tests[1].id },
  { body: 'What is tag <b> for?',                          test_id: tests[2].id },
  { body: 'What is the main loop used for dictionaries?',  test_id: tests[3].id },
  { body: 'Do procs have a similar behaviour as lambdas?', test_id: tests[4].id } ])

answers = Answer.create([
  { body: "Yes",       correct: true, question_id: questions[0].id },
  { body: "Yes",       correct: true, question_id: questions[1].id },
  { body: "Bold font", correct: true, question_id: questions[2].id },
  { body: "For...in",  correct: true, question_id: questions[3].id },
  { body: "Yes, but lambda is more strict wuth arguments", correct: true, question_id: questions[4].id },
  
  { body: "No",      question_id: questions[0].id },
  { body: "No",      question_id: questions[1].id },
  { body: "Cursive", question_id: questions[2].id },
  { body: "While",   question_id: questions[3].id },
  { body: "Procs is an alias of lambda", question_id: questions[4].id },
])

users[0].tests << tests[0]
users[0].tests << tests[2]
users[1].tests << tests[1] 