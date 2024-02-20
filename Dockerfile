FROM python:3.9

# Set up a virtual environment
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

ENV TRANSFORMERS_CACHE=/tmp/huggingface_cache

WORKDIR /code

COPY ./requirements.txt /code/requirements.txt
RUN /opt/venv/bin/pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . .

CMD ["gunicorn", "-b", "0.0.0.0:7860", "main:app"]