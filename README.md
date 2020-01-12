# Fretadão challenge

## Português (English version right after)

Essa é uma aplicação web criada para o desafio do Fretadão. 
O objetivo da aplicação é utilizar o web-scraping para trazer informações de um usuário cadastrado no Twitter.

A aplicação foi feita nas seguintes tecnologias:

- [Ruby on Rails](https://rubyonrails.org/)
- [Nokogiri](https://nokogiri.org/)
- [HTTParty](https://github.com/jnunemaker/httparty)
- [Ransack](https://github.com/activerecord-hackery/ransack)
- [ShortURL](https://github.com/robbyrussell/shorturl)
- [Bootstrap](https://getbootstrap.com/)

Para os testes feitos:
- [RSpec](https://rspec.info/)
- [VCR](https://github.com/vcr/vcr)
- [Webmock](https://github.com/bblimke/webmock)
- [Shouldmatchers](https://github.com/thoughtbot/shoulda-matchers)
- [FactoryBot](https://github.com/thoughtbot/factory_bot)


### Começando

Para instalar o projeto, rode os seguintes códigos no seu terminal dentro do seu dirétorio de projetos:
```
1) Abra seu terminal e clone o projeto:
git clone https://github.com/aldowitzke/fretadao_challenge.git
# É possível que seja pedido suas credenciais para clonar o repositório

2) Entre no novo diretório criado
cd fretadao_challenge

3) Vamos configurar:
bundle install
rails db:setup

4) Rode o servidor:
rails server

5) Abra http://localhost:3000/ em seu navegador

6) Para rodar os testes:
rspec (ou rake)
```

### A aplicação

A aplicação se baseia nas seguintes features:

1) É possível cadastrar um usuário do Twitter, provendo a url de seu perfil (por exemplo: https://twitter.com/usefretadao)
2) A aplicação irá retornar os dados do usuário, como o username, descrição, imagem de perfil e link para a página do Twitter do usuário
3) A aplicação possui uma barra de pesquisa capaz de procurar usuários já cadastrados por meio de um username ou uma palavra que contenha na descrição do perfil do usuário no Twitter.
4) É possível editar esses perfis buscados, atribuindo uma nova URL para que seja atualizado.

### Considerações sobre a aplicação

- Atualmente, a aplicação se encontra apenas em inglês.
- A barra de pesquisa é sensível a acentos.
- A aplicação busca por URLs que sejam http ou https. Por isso, na hora de cadastrar um usuário, certifique-se que esteja nesse padrão. Caso contrário, a aplicação não encontrará seu usuário.

## English

This is a web app created for the Fretadão company challenge.
The web app goal is to make use of web-scraping to bring users' information from Twitter.

The web application was built on the following technologies:

- [Ruby on Rails](https://rubyonrails.org/)
- [Nokogiri](https://nokogiri.org/)
- [HTTParty](https://github.com/jnunemaker/httparty)
- [Ransack](https://github.com/activerecord-hackery/ransack)
- [ShortURL](https://github.com/robbyrussell/shorturl)
- [Bootstrap](https://getbootstrap.com/)

For testing:
- [RSpec](https://rspec.info/)
- [VCR](https://github.com/vcr/vcr)
- [Webmock](https://github.com/bblimke/webmock)
- [Shouldmatchers](https://github.com/thoughtbot/shoulda-matchers)
- [FactoryBot](https://github.com/thoughtbot/factory_bot)

### Getting started

Run the following commands inside your projects directory:

```
1) Open your terminal and let's clone the repo:

git clone https://github.com/aldowitzke/fretadao_challenge.git
# It is possible you will be asked for credentials.

2) Enter your new directory
cd fretadao_challenge

3) Let's config:
bundle install
rails db:setup

4) Run the server:
rails server

5) Run http://localhost:3000/ on your browser.

5) If you like, run the tests
rspec (or rake)
```

### The application

This application is based on the following features:

1) It is possible to register a Twitter user, giving the user's profile url (i.e: https://twitter.com/usefretadao)
2) The application will give you back the users information, like username, description, profile picture and a link to the user's Twitter profile.
3) The application has a search bar capable of searching registered users by username or a word that contains in the user's profile description.
4) It is possible to edit these searched users, giving a new URL to update the register.

### Considerations

- Right now, the app is only in English
- The search bar is accent sensitive.
- The application searches for http or https URL. Therefore, when creating a new user, make sure you are using this pattern. Otherwise, the app will not find your user.
