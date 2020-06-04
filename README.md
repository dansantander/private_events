# Private Events
In this project we demonstrate working with ActiveRecord's associations (one to many, many to many).

## Features

<ul>
  <li>A client can see all Events and create an account</li>
  <li>Users can publish events and invite other users to events created</li>
  <li>Events are displayed in Past Events and Upcoming Events categories</li>
  <li>A single event lists users attending to that specific event</li>
</ul>

## Endpoints covered in this project
  ## users & sessions
  - POST localhost:3000 /users/new  - For Signing up a new client.
  - POST localhost:3000 /users/user_id - For viewing a user's dashboard/profile.
  - GET localhost:3000 /signin - For logging in a user.
  - POST localhost:3000 /logout - For signing out a user.

## events
  - POST localhost:3000 /events/new - For creating a new event.
  - GET localhost:3000 /events  - For viewing all events.

  ## invitations
  - POST localhost:3000 /invitations/new - For inviting users to an event.
  - GET  localhost:3000 /invitations - For viewing both past and upcoming invitations.

## Installation
  - Ensure the project dependencies are installed
  - clone the repo the command `git clone git@github.com:dansantander/private_events.git`
  - Navigate to the project folder
  - run `bundle` or `bundle install`

## Getting Started
  - Head over to your server on localhost:3000
  - Create a new User using the Signup form and start a session by Signing in.
  - Create a new Event with a Title and a Date.
  - Make an Invitation for other Users to attend the Event you created.

## Built With

  - Ruby 2.7 <br>
  - Ruby on Rails 5.2 <br>
  - HTML forms, Rails form_tag and form_for
  - Git, Github and VScode <br>

## Authors

👤 **Daniel Santander**

- Github: [@dansantander](https://github.com/dansantander)
- Linkedin: [Daniel Santander](https://www.linkedin.com/in/daniel-santander)
- Twitter: [@dansantandr](https://twitter.com/dansantandr)

👤 **Alfred Ezaka**

- Github: [@codecell](https://github.com/codecell)
- Twitter: [@the_codecell](https://twitter.com/the_codecell)
- Linkedin: [ezaka alfred](https://www.linkedin.com/in/alfrednoble/)

### Contributing

Contributions, issues and feature requests are welcome! [issues page](issues/).

### License

<strong>Creative Commons • May 2020</strong>