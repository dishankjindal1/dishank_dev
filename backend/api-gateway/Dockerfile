# Use latest stable channel SDK.
FROM dart:stable AS dev

# Resolve app dependencies.
WORKDIR /app
COPY api-gateway ./
RUN dart pub get

RUN dart compile exe bin/server.dart -o bin/server

# Build minimal serving image from AOT-compiled `/server`
# and the pre-built AOT-runtime in the `/runtime/` directory of the base image.
FROM scratch
COPY --from=dev /runtime/ /
COPY --from=dev /app/bin/server /app/bin/

# Start server.
EXPOSE 8080
CMD ["/app/bin/server"]
