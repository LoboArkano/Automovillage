# RoR Capstone Project: Automovillage 

> This project contains a web news page on motorsports. It is possible to create a user account and publish articles with an image. You can also vote for the articles you like.

## Screenshots

![image](https://user-images.githubusercontent.com/33432289/87835708-8193a880-c853-11ea-9168-15c7343997f9.png)

![image](https://user-images.githubusercontent.com/33432289/87835754-9ff9a400-c853-11ea-96b5-4380b18a4822.png)

## Live Demo

[Live version](https://automovillage.herokuapp.com/)

## Built With

- Ruby v2.7.1

- Ruby on Rails v5.2.3

- Cloudinary

## Future Features

- Install trix gem to use a text editor 

- Add a user profile

## Getting Started

To get a local copy up and running follow these simple example steps.
```
   git clone git@github.com:LoboArkano/Automovillage.git
```

### Prerequisites

- Ruby: 2.6.3

- Rails: 5.2.3

- Postgres: >=9.5

### Setup

Install gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

You need to create at least one category, like this:

```
   Category.create(name: "Formula 1", priority: 1)
```

Create your user account only with your name:

![image](https://user-images.githubusercontent.com/33432289/87968266-c141d680-ca85-11ea-9241-a1280afafee7.png)


To create an article, select CREATE ARTICLE in the navbar and give a title, content, image, and at least one category. You need to be logged in to perform this action.
![image](https://user-images.githubusercontent.com/33432289/87968849-ac197780-ca86-11ea-9f2e-c58e3bb76ece.png)

To add a vote to an article, click the category section and click the Add Vote link. You need to be logged in to perform this action.

![image](https://user-images.githubusercontent.com/33432289/87969399-b38d5080-ca87-11ea-80b2-d964c9095e10.png)


### Run tests

To run all tests use this command:

```
    bundle exec rspec
    
```
To run only model tests run this instead:

```
    bundle exec rspec spec/models

```

For views tests only, execute this:

```
    bundle exec rspec spec/feature

```

## Author

👤 **Roberto Perez Jimenez**

- Github: [@LoboArkano](https://github.com/LoboArkano)
- Twitter: [@LoboArcano92](https://twitter.com/LoboArcano92)
- Linkedin: [linkedin](https://www.linkedin.com/in/jose-roberto-perez-jimenez/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/LoboArkano/Automovillage/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Give a ⭐️ if you like this project!

Design idea by Nelson Sakwa on Behance

## 📝 License

This project is MIT licensed.
