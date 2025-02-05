# Use an official light Ruby base image
FROM ruby:3.2

# Set environment variables
ENV RAILS_ENV=production \
    NODE_ENV=production \
    BUNDLE_JOBS=4 \
    BUNDLE_RETRY=3 \
    BUNDLER_VERSION=2.4.0 \
    APP_HOME=/app \
    RAILS_MASTER_KEY=220ca738ea5d156f2aee4f3a792d48f7

# Set the working directory
WORKDIR $APP_HOME

# Install dependencies
RUN apt-get update -qq && apt-get install -y --no-install-recommends \
    build-essential \
    libpq-dev \
    nodejs \
    yarn \
    && rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler -v "$BUNDLER_VERSION"

# Copy Gemfile and Gemfile.lock first to leverage Docker caching
COPY Gemfile Gemfile.lock ./
RUN bundle install --verbose

# Copy the rest of the application code
COPY . .

# Precompile assets and cleanup unnecessary files
RUN bundle exec rake assets:precompile && \
    bundle exec rake assets:clean

# Expose the application port
EXPOSE 3000

# Set entrypoint script
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["/usr/bin/docker-entrypoint.sh"]

# Create a non-root user for security
RUN useradd -m appuser && chown -R appuser:appuser /$APP_HOME
USER appuser

# Command to run the application
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
