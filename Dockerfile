FROM bitwalker/alpine-elixir-phoenix:latest

WORKDIR /app

# Copy dependencies
COPY ["mix.exs", "mix.lock", "."]

# Install hex locally 
CMD ["mix", "local.hex"]

# Fetch and cache dependencies
CMD ["mix", "deps.get"]
CMD ["mix", "deps.complile"]

# Start server
ENTRYPOINT ["mix", "phx.server"]