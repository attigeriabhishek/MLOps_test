# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt ./

# Install any needed packages specified in requirements.txt
RUN python -m pip install --upgrade pip
RUN pip install -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . .

# Make port 8501 available to the world outside this container
EXPOSE 8503

# Define environment variable
ENV NAME MSRIT_MLOps

# Run streamlit when the container launches
CMD ["streamlit", "run", "scripts/app.py"]
