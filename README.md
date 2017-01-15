# Core Connection

This beautiful, powerful student profiles application displays all CodeCore alumni, including
those available for hire!

## Features

Some super cool stuff.

## Pricing
$1,000,000 CAD

Or best offer.

## Set up

### Required environment variables

```shell
# Amazon S3 to store profile files
S3_KEY
S3_SECRET
S3_REGION
S3_BUCKET_NAME

# Gmail account for sending emails
email_user_name
email_password
```

### Administrators

Don't forget to create a user with its `admin` field set to `true` to approve user profiles!

## Setup Docker development environment
1. clone repo
2. set environment variables in `.env` file (see **Required environment variables** above)
3. start containers: `docker-compose up` (or `docker-compose up -d`)
4. create development & test databases: `docker-compose exec web rake db:setup`
5. (*optional*) create admin account: `docker-compose exec web rails r "User.create! first_name: 'admin', last_name: 'user', email: 'admin@example.com', password: 'password', admin: true"`
