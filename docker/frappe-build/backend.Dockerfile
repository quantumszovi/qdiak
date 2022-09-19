ARG FRAPPE_VERSION
FROM frappe/frappe-worker:v${FRAPPE_VERSION}

USER root

ARG APP_NAME
COPY . ../apps/${APP_NAME}

RUN --mount=type=cache,target=/root/.cache/pip \
    install-app ${APP_NAME}

USER frappe