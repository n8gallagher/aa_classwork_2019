require 'sqlite3'
require 'singleton'

class QuestionsDatabase < SQLite3::Database
  include Singleton
  def initialize
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end
end

class Question
  attr_accessor :title, :body
  attr_reader :id

  def self.find_by_id(id)
    question = QuestionsDatabase.instance.execute(<<-SQL, id)
      SELECT
        *
      FROM
        questions
      WHERE
       id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def self.find_by_user_id(user_id)
    question = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        users
      WHERE
       id = ?
    SQL
    return nil unless question.length > 0

    Question.new(question.first)
  end

  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM questions")
    data.map { |datum| Question.new(datum) }
  end

  def initialize(options)
    @id = options['id']
    @title = options['title']
    @body = options['body'] 
    @user_id = options['user_id'] 
  end

  def insert
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body)
      INSERT INTO
        questions (title, body)
      VALUES
        (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.title, self.body, self.id)
      UPDATE
        questions
      SET
        title = ?, body = ?
      WHERE
        id = ?
    SQL
  end
  protected
  attr_writer :id

end


class User
  # CREATE TABLE users (
  # id INTEGER PRIMARY KEY,
  # fname VARCHAR(255) NOT NULL,
  # lname VARCHAR(255) NOT NULL
  attr_accessor :fname, :lname
  attr_reader :id
  def self.all
    data = QuestionsDatabase.instance.execute("SELECT * FROM users")
    data.map { |datum| User.new(datum) }
  end

 def self.find_by_name(fname, lname)
    user = QuestionsDatabase.instance.execute(<<-SQL, fname, lname)
      SELECT
        *
      FROM
        users
      WHERE
       fname = ?, lname = ?
    SQL
    return nil unless user.length > 0

    User.new(user.first)
  end

  def initialize(options)
    @id = options['id']
    @fname = options['fname']
    @lname = options['lname']  
  end

  def insert
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.lname)
      INSERT INTO
        users (fname, lname)
      VALUES
        (?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    # raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.fname, self.id, self.lname)
      UPDATE
        users
      SET
        fname = ?, lname = ?
      WHERE
        id = ?
    SQL
  end

  def authored_questions
    my_id = self.id
    Question.find_by_user_id(my_id)
  end

  protected
  attr_writer :id



end

class Reply

  # CREATE TABLE replies (
  # id INTEGER PRIMARY KEY,
  # parent_reply_id INTEGER,
  # body TEXT NOT NULL,
  # question_id INTEGER,
  # FOREIGN KEY (question_id) REFERENCES questions(id),
  # FOREIGN KEY (parent_reply_id) REFERENCES replies(id)

  attr_accessor :body, :parent_reply_id

  def self.find_by_user_id(user_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, user_id)
      SELECT
        *
      FROM
        users
        JOIN questions
        ON questions.user_id = users.id
        JOIN replies
        ON questions.id = replies.question_id
      WHERE
       user_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def self.find_by_question_id(question_id)
    reply = QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT
        *
      FROM
        questions
        JOIN users
        ON questions.user_id = users.id
        JOIN replies
        ON questions.id = replies.question_id
      WHERE
       question_id = ?
    SQL
    return nil unless reply.length > 0

    Reply.new(reply.first)
  end

  def initialize(options)
    @id = options['id']
    @body = options['body']
    @parent_reply_id = options['parent_reply_id']
    @question_id = options['question_id']  
  end

  def insert
    raise "#{self} already in database" if self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.body, user_id, question_id)
      INSERT INTO
        replies (body, user_id, question_id)
      VALUES
        (?, ?, ?)
    SQL
    self.id = QuestionsDatabase.instance.last_insert_row_id
  end

  def update
    # raise "#{self} not in database" unless self.id
    QuestionsDatabase.instance.execute(<<-SQL, self.body, user_id, question_id)
      UPDATE
        users
      SET
        body = ?
      WHERE
        user_id = ? 
      OR
        question_id = ?
    SQL
  end

  def author
    QuestionsDatabase.instance.execute(<<-SQL, question_id)
      SELECT 
        fname, lname
      FROM
        users
      JOIN questions 
        ON users.id = questions.user_id
      WHERE
        question_id = ?

    SQL
  end

  def question
  
  end

  def parent_reply

  end

  def child_replies

  end

  protected
  attr_writer :id

end

# a = Question.new('title' => 'AA', 'body' => 'AAAAdfds')
# b = User.new('fname'=> 'b', 'lname'=> 'B')
# jeff = User.new('fname'=>"Jeff", 'lname'=>"Beeeezoooso")
