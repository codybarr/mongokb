# CS50 Final Project - Video Notes

## Knowledge base features

- Motivation behind building the app
- Article Management (fields: title, keywords, content, attachments, revision notes, kba#, timestamps)
- Versioning
- User registrations
- Favoriting

## Development Notes

- Environment: Macbook Pro / OSX
- Sublime Text
- Rails
- MongoDB / Mongoid
- Templating engine: http://slim-lang.com/index.html
- Bootstrap
- Hosting: Openshift

## Interesting Problems

- strftotime: http://apidock.com/ruby/v1_9_3_125/Time/strftime (different time zones)

## Plan to implement

- WYSIWYG (for embedding screenshots, etc.)
- Article status (for workflow processing - ie. new, draft, pending, review, published, etc.)
- Multiple attachments
- Ability to revert to previous versions of an article
- Full text search (fuzzy searching, field weight/score)
- User roles (ie. Admin, Manager, Agent) - for fine tuned access control -> agents can create new drafts and view existing articles only / admins can delete articles and publish drafts, etc.
- Ability for mangers to publish articles to front page (like a recommended reading section)
- Ability for agents to add comments to articles to report errors, etc.
- Admin section for filtering articles and reviewing agents comments, publishing changes, etc.