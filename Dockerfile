FROM jupyter/pyspark-notebook

USER root

# Remove the pre-installed version of Spark
RUN rm -rf $SPARK_HOME

# Install the desired version of Spark
RUN wget -qO- "https://archive.apache.org/dist/spark/spark-3.3.0/spark-3.3.0-bin-hadoop3.tgz" | tar -xz -C /usr/local/ && \
    mv /usr/local/spark-3.3.0-bin-hadoop3 /usr/local/spark

# Set environment variables for Spark
ENV SPARK_HOME=/usr/local/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV PYSPARK_PYTHON=python3

USER $NB_UID

# Install PySpark
RUN pip install pyspark==3.3.0
