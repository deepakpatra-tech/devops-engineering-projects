FROM python:3.12-slim AS Build
WORKDIR /app
COPY requirements.txt /app/
RUN pip install --no-cache-dir --prefix=/install -r requirements.txt

# Multi Stage

FROM python:3.12-slim AS RUN
WORKDIR /app
COPY --from=Build /install /usr/local
COPY app.py /app/
EXPOSE 5000
ENTRYPOINT [ "python" ]
CMD [ "app.py" ]