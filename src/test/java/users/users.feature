Feature: Cadastro de Usuários

  Background:
  * url "http://course-javatest.herokuapp.com"

    Scenario: Retorna todos os usuários

      *  def listaUsuarios = read('usuarios.json')

      Given path 'users'
      When method get
      Then status 200
      And match response == listaUsuarios

     Scenario: Retorna um usuário
       
       Given path 'users'
       And path 6
       When method get
       Then status 200
       And match response == {"id": 6, "name": "Lyn Heaney", "email": "heaney_lyn@hotmail.com", "phone": "+994 1-269-626-6007 x3795", "password": "12345678"}

     Scenario: Cadastrando um usuário

       * def novoUsuario =
      """
      {
        "name" : "Ronaldinho Gaúcho",
        "email" : "r10@gmail.com",
        "password" : "123456",
        "phone" : "1998765432"
      }
      """

       Given path 'users'
       And request novoUsuario
       When method post
       Then status 201
       And match response == {id: '#notnull', name : "Ronaldinho Gaúcho", email : "r10@gmail.com", password : "123456", phone : "1998765432"}

       * def id = response.id

       Given path 'users'
       And path id
       When method get
       Then status 200

       * def alteraUsuario =
      """
      {
        "name" : "Lionel Messi",
        "email" : "messi@gmail.com",
        "password" : "123456",
        "phone" : "1998765432"
      }
      """

       Given path 'users'
       And path id
       And request alteraUsuario
       When method put
       Then status 200

       Given path 'users'
       And path id
       When method get
       Then status 200

       Given path 'users'
       And path id
       When method delete
       Then status 204

