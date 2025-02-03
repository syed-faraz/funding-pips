# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# funding-pips

Here's a best practice `Dockerfile` for a Ruby on Rails application. It focuses on security, performance, and efficient dependency management.

### Explanation of Best Practices:
1. **Use a Minimal Base Image**: The official `ruby:3.2` image is used to ensure compatibility.
2. **Set Environment Variables**: Optimizes performance and prevents unnecessary dependencies.
3. **Use a Working Directory**: Ensures commands execute in the correct application directory.
4. **Install Dependencies Efficiently**: Uses `apt-get` with `--no-install-recommends` to minimize installed packages.
5. **Leverage Docker Layer Caching**: Copies and installs gems before adding application code.
6. **Precompile Assets**: Reduces container startup time.
7. **Expose Only Necessary Ports**: Ensures security.
8. **Use an EntryPoint Script**: Simplifies initialization tasks.
9. **Run the App Using `puma`**: A better choice than `rails server` for production.
