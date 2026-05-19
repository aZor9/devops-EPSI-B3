# Image de base
FROM python:3.10-slim

# Variables d'environnement Python
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PIP_NO_CACHE_DIR=1

# Répertoire de travail
WORKDIR /app

# Copier les dépendances et les installer
COPY src/requirements.txt ./requirements.txt
RUN pip install --upgrade pip && \
    pip install -r ./requirements.txt

# Copier le reste du code
COPY . .

# Port exposé par Streamlit
EXPOSE 8501

# Commande pour lancer l'application
CMD ["streamlit", "run", "src/Home.py", "--server.address=0.0.0.0", "--server.port=8501"]
