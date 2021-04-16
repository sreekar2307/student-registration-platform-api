#!/bin/bash
set -e
rm -f /app/tmp/pids/server.pid
rails db:migrate 2>/dev/null || rails db:setup RAILS_ENV=$RAILS_ENV
exec "$@"