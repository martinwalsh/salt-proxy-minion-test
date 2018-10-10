FROM python:alpine

RUN apk add --no-cache tini

WORKDIR /app
ADD . /app
RUN pip install -r requirements.txt

EXPOSE 8000

ENTRYPOINT ["tini", "--"]
CMD ["python", "-u", "rest.py", "--address", "0.0.0.0", "--port", "8000", "--debug"]
